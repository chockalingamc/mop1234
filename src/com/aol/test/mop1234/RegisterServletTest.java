package com.aol.test.mop1234;

import junit.framework.TestCase;

import org.apache.http.client.CookieStore;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.junit.Test;

public class RegisterServletTest extends TestCase {

	@Test
	public void testGetCookie(){
		RegisterServlet servlet = new RegisterServlet();
		CookieStore cookieStore = new BasicCookieStore();
		CloseableHttpClient httpClient = HttpClientBuilder.create().setDefaultCookieStore(cookieStore).build();
		try {
			servlet.getSessionCookie(null, null, httpClient, cookieStore);
			Cookie cookie = cookieStore.getCookies().get(0);
			assertEquals("frontend", cookie.getName());
		} catch (Exception e) {
			e.printStackTrace();
			assertTrue(false);
		}
	}
}
