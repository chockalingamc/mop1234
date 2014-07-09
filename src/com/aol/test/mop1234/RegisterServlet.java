package com.aol.test.mop1234;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * RegisterServlet acts as a proxy between a local form-based JSP that lets users enter 
 * information for creating a new account, and the actual account creation website at 
 * http://myopenissues.com/magento/index.php/customer/account/create/
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private final String URL_CREATE = "http://myopenissues.com/magento/index.php/customer/account/create/";
	private final String URL_CREATE_POST = "http://myopenissues.com/magento/index.php/customer/account/createpost/";
	private final String URL_ACCOUNT_HOME = "http://myopenissues.com/magento/index.php/customer/account/index/";
	private final String URL_JSP = "/register.jsp";
	private final String URL_JSP_SIMPLE = "/register_simple.jsp";
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// this servlet expects data in a POST request
		// so forward all GET requests to register.jsp, which makes the correct POST request
		String jsp = this.URL_JSP;
		if ("true".equals(request.getParameter("simple"))) {
			jsp = this.URL_JSP_SIMPLE;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		CookieStore cookieStore = new BasicCookieStore();
		CloseableHttpClient httpClient = HttpClientBuilder.create().setDefaultCookieStore(cookieStore).build();
		
		try {
			// get the session cookie by making a GET request to the create account page
			getSessionCookie(request, response, httpClient, cookieStore);
			// use the user input data along with the cookie to make a POST request to create the account
			String redirectLocation = createAccount(request, response, httpClient, cookieStore);
			// the POST response redirects to either the home page upon success
			// or back to the create page with appropriate error messages if the account could not be created
			processRedirect(request, response, httpClient, cookieStore, redirectLocation);
		} catch (Exception e) {
			this.dispatchRequest(request, response, "FAILURE", "SERVER ERROR. " + e.getMessage());
		} finally {
			httpClient.close();
		}
	}
	
	/**
	 * This method fetches the create account page. In the response, the server sends back a session cookie that will used in further communications.
	 * 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param httpClient CloseableHttpClient
	 * @param cookieStore CookieStore
	 * @throws ClientProtocolException
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void getSessionCookie (HttpServletRequest request, HttpServletResponse response, CloseableHttpClient httpClient, CookieStore cookieStore) 
			throws ClientProtocolException, IOException, ServletException {
		
		HttpGet initGet = new HttpGet(this.URL_CREATE);
		CloseableHttpResponse initResponse = httpClient.execute(initGet);
		
		try {
			System.out.println("Initial GET Response : " + initResponse.getStatusLine());
			int code = initResponse.getStatusLine().getStatusCode();
			if (code == 200) {
				List<Cookie> cookies = cookieStore.getCookies();
				for (Cookie cookie : cookies) {
					System.out.println("Cookie from the initial GET request : " + cookie.toString());
				}
				EntityUtils.consume(initResponse.getEntity());
			} else {
				this.dispatchRequest(request, response, "FAILURE", "SERVER ERROR. Unexpected response code from the source site " + this.URL_CREATE + " [HTTP code " + code + "]");
			}
		} finally {
			initResponse.close();
		}
	}

	/**
	 * This method sends the user entered data, along with the session cookie (which is in the cookie store of the http client)
	 * to the server for creating an account. The server might update the cookie in the response upon success. 
	 * But that will automatically be updated in the cookie store and available to the http client for use in the next interaction
	 * with the server.
	 * 
	 * This method returns the redirect location obtained from the server response's header
	 * 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param httpClient CloseableHttpClient
	 * @param cookieStore CookieStore
	 * @return String
	 * @throws ClientProtocolException
	 * @throws IOException
	 * @throws ServletException
	 */
	protected String createAccount (HttpServletRequest request, HttpServletResponse response, CloseableHttpClient httpClient, CookieStore cookieStore) 
			throws ClientProtocolException, IOException, ServletException {
		String redirectLocation = null;
		HttpPost createPost = new HttpPost(this.URL_CREATE_POST);
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		Map<String, String[]> params = request.getParameterMap();
		for (String key:params.keySet()) {
			String[] values = params.get(key);
			for (String value:values) {
				nvps.add(new BasicNameValuePair(key, value));
			}
		}
		createPost.setEntity(new UrlEncodedFormEntity(nvps));
		CloseableHttpResponse createResponse = httpClient.execute(createPost);

		try {
			System.out.println("Create POST Response : " + createResponse.getStatusLine());
			int code = createResponse.getStatusLine().getStatusCode();
			if (code == 302) {
				List<Cookie> cookies = cookieStore.getCookies();
				for (Cookie cookie : cookies) {
					System.out.println("Cookie after POST request for create : " + cookie.toString());
				}
				redirectLocation = createResponse.getHeaders("Location")[0].getValue();
				EntityUtils.consume(createResponse.getEntity());
			} else {
				this.dispatchRequest(request, response, "FAILURE", "SERVER ERROR. Unexpected response code from the source site " + this.URL_CREATE_POST + " [HTTP code " + code + "]");
			}
		} finally {
			createResponse.close();
		}
		
		return redirectLocation;
	}
	
	/**
	 * This method processes the redirect location received while creating the account.
	 * Account has been created successfully if the redirect location is http://myopenissues.com/magento/index.php/customer/account/index/. 
	 * - Proceed to my account page.
	 * Account creation failed if the redirect location is http://myopenissues.com/magento/index.php/customer/account/create/. 
	 * - Go back to fetch the account create page which has appropriate error messages in it.
	 * A redirect to any other location will be considered a server error.
	 * 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param httpClient CloseableHttpClient
	 * @param cookieStore CookieStore
	 * @param redirectLocation String
	 * @throws ClientProtocolException
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void processRedirect (HttpServletRequest request, HttpServletResponse response, CloseableHttpClient httpClient, CookieStore cookieStore, String redirectLocation) 
			throws ClientProtocolException, IOException, ServletException {
		
		if (this.URL_ACCOUNT_HOME.equals(redirectLocation)) {
			// account has been created - notify the user
			request.setAttribute("location", redirectLocation);
			this.dispatchRequest(request, response, "SUCCESS", "Account created successfully");
		} else if (this.URL_CREATE.equals(redirectLocation)) {
			// the account could not be created
			// make one more GET request to fetch the intial create page, which, because of the cookie that is sent along this time,
			// will give back a page with a <ul class="message"/> tag containing error messages
			HttpGet redirectGet = new HttpGet(this.URL_CREATE);
			CloseableHttpResponse redirectResponse = httpClient.execute(redirectGet);
			try {
				System.out.println("Redirect GET Response : " + redirectResponse.getStatusLine());
				int code = redirectResponse.getStatusLine().getStatusCode();
				if (code == 200) {
					List<Cookie> cookies = cookieStore.getCookies();
					for (Cookie cookie : cookies) {
						System.out.println("Cookie after REDIRECT GET request : " + cookie.toString());
					}
					HttpEntity entity = redirectResponse.getEntity();
					// process the entity and grab the <ul class="messages"> tag html content
					StringBuffer htmlContent = new StringBuffer();
					BufferedReader reader = new BufferedReader(new InputStreamReader(entity.getContent()));
					String line = reader.readLine();
					while (line != null) {
						htmlContent.append(line);
						line = reader.readLine();
					}
					Document doc = Jsoup.parse(htmlContent.toString());
					Elements ulList = doc.select("ul.messages");
					String errorMsgHtml = null;
					for (int i=0; i<ulList.size(); i++) {
						Element ul = ulList.get(i);
						errorMsgHtml = ul.outerHtml();
						System.out.println(errorMsgHtml);
					}
					// use the html content to display information to the user in the local JSP
					this.dispatchRequest(request, response, "FAILURE", errorMsgHtml);
				} else {
					this.dispatchRequest(request, response, "FAILURE", "SERVER ERROR. Unexpected response code from the source site " + this.URL_CREATE + " [HTTP code " + code + "]");
				}
			} finally {
				redirectResponse.close();
			}
		} else {
			this.dispatchRequest(request, response, "FAILURE", "SERVER ERROR. " + this.URL_CREATE_POST + " is trying to redirect to " + redirectLocation);
		}
	}
	
	/**
	 * This method dispatches request to the local JSP with some additional information attributes
	 * 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param result String
	 * @param message String
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void dispatchRequest (HttpServletRequest request, HttpServletResponse response, String result, String message) throws ServletException, IOException {
		request.setAttribute("result", result);
		request.setAttribute("message", message);
		String jsp = this.URL_JSP;
		if ("true".equals(request.getParameter("simple"))) {
			jsp = this.URL_JSP_SIMPLE;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request,response);
	}
}
