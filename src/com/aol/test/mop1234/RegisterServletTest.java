package com.aol.test.mop1234;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import junit.framework.TestCase;

import org.apache.http.Header;
import org.apache.http.ProtocolVersion;
import org.apache.http.client.CookieStore;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicStatusLine;
import org.junit.Test;
import org.mockito.Mockito;

public class RegisterServletTest extends TestCase {

	@Test
	public void testGetCookie(){
		RegisterServlet servlet = new RegisterServlet();
		CookieStore cookieStore = new BasicCookieStore();
		CloseableHttpClient httpClient = HttpClientBuilder.create().setDefaultCookieStore(cookieStore).build();

		HttpServletRequest mockRequest = Mockito.mock(HttpServletRequest.class);
		HttpServletResponse mockResponse = Mockito.mock(HttpServletResponse.class);
		
		try {
			servlet.getSessionCookie(mockRequest, mockResponse, httpClient, cookieStore);
			Cookie cookie = cookieStore.getCookies().get(0);
			assertEquals("frontend", cookie.getName());
		} catch (Exception e) {
			e.printStackTrace();
			assertTrue(false);
		}
	}
	
	@Test
	public void testCreateAccountFail(){
		RegisterServlet servlet = new RegisterServlet();
		CookieStore cookieStore = new BasicCookieStore();

		HttpServletRequest mockRequest = Mockito.mock(HttpServletRequest.class);
		HttpServletResponse mockResponse = Mockito.mock(HttpServletResponse.class);
		CloseableHttpClient mockHttpClient = Mockito.mock(CloseableHttpClient.class);
		CloseableHttpResponse mockHttpResponse = Mockito.mock(CloseableHttpResponse.class);
		
		try {
			Header testHeader = new BasicHeader("Location", "Test Location");
			Mockito.when(mockHttpClient.execute(Mockito.any(HttpPost.class))).thenReturn(mockHttpResponse);
			Mockito.when(mockHttpResponse.getStatusLine()).thenReturn(new BasicStatusLine(new ProtocolVersion("HTTP", 1, 1), 302, "Status line from mockito class"));
			Mockito.when(mockHttpResponse.getHeaders(Mockito.anyString())).thenReturn(new Header[]{testHeader});
			String result = servlet.createAccount(mockRequest, mockResponse, mockHttpClient, cookieStore);
			assertEquals("Test Location", result);
		} catch (Exception e) {
			e.printStackTrace();
			assertTrue(false);
		}
	}
}
