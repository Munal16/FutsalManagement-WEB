package com.futsal.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.futsal.util.Cookieutil;
import com.futsal.util.Sessionutil;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class Authenticationfilter implements Filter {

	private static final String LOGIN = "/login";
	private static final String REGISTER = "/register";
	private static final String HOME = "/home";
	private static final String ROOT = "/";
	private static final String DASHBOARD = "/dashboard";
	private static final String BOOKING_LIST = "/bookinglist";
	private static final String PRODUCT_LIST = "/productlist";
	private static final String BOOKING = "/booking";
	private static final String SHOP = "/product";
	private static final String CONTACT = "/contactus";
	private static final String ABOUT = "/aboutus";
	private static final String FUTSAL_COURT = "/futsalcourts";
	private static final String CAFETERIA = "/cafeteria";
	private static final String USER_PROFILE = "/user";
	private static final String LOGOUT = "/logout";
	private static final String USER_MANAGEMENT = "/usermanagement";
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Initialization logic, if required
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();

		// Allow access to resources (static files)
		if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css") || uri.endsWith(".js")) {
			chain.doFilter(request, response);
			return;
		}

		boolean isLoggedIn = Sessionutil.getAttribute(req, "username") != null;
		String userRole = Cookieutil.getCookie(req, "role") != null
				? Cookieutil.getCookie(req, "role").getValue()
				: null;

		if ("admin".equals(userRole)) {
			// Admin access rules
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
				res.sendRedirect(req.getContextPath() + DASHBOARD);
			} else if (uri.endsWith(DASHBOARD) || uri.endsWith(BOOKING_LIST) || uri.endsWith(PRODUCT_LIST)
					|| uri.endsWith(HOME) || uri.endsWith(ROOT)) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath() + DASHBOARD);
			}
		} else if ("user".equals(userRole)) {
			// User access rules
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
				res.sendRedirect(req.getContextPath() + HOME);
			} else if (uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.endsWith(BOOKING) || uri.endsWith(SHOP)
					|| uri.endsWith(CONTACT) || uri.endsWith(ABOUT) || uri.endsWith(FUTSAL_COURT)
					|| uri.endsWith(CAFETERIA) || uri.endsWith(USER_PROFILE)) {
				chain.doFilter(request, response);
			} else if (uri.endsWith(DASHBOARD) || uri.endsWith(BOOKING_LIST) || uri.endsWith(PRODUCT_LIST)) {
				res.sendRedirect(req.getContextPath() + HOME);
			} else {
				res.sendRedirect(req.getContextPath() + HOME);
			}
		} else {
			// Not logged in
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT)
					|| uri.endsWith(ABOUT) || uri.endsWith(CONTACT)) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath() + LOGIN);
			}
		}
	}

	@Override
	public void destroy() {
		// Cleanup logic, if required
	}
}
