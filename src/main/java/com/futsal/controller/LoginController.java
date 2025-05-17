package com.futsal.controller;

import java.io.IOException;

import com.futsal.model.customermodel;
import com.futsal.service.loginservice;
import com.futsal.util.Cookieutil;
import com.futsal.util.Sessionutil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * LoginController is responsible for handling login requests. It interacts with
 * the LoginService to authenticate users.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login", "/" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final loginservice loginservice;

	/**
	 * Constructor initializes the LoginService.
	 */
	public LoginController() {
		this.loginservice = new loginservice();
	}

	/**
	 * Handles GET requests to the login page.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * Handles POST requests for user login.
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		System.out.println("🔐 Attempting login with Username: " + username + ", Password: " + password);

		boolean isAdmin = username.equals("admin") && password.equals("admin123");

		// Use setters instead of constructor
		customermodel user = new customermodel();
		user.setUsername(username);
		user.setPassword(password);

		boolean isCustomer = loginservice.loginUser(user); // existing login check

		if (isAdmin) {
			// Set session and cookie for admin
			Sessionutil.setAttribute(req, "username", "admin");
			Cookieutil.addCookie(resp, "role", "admin", 30 * 60); // 30 mins
			System.out.println("✅ Admin logged in. Redirecting to dashboard...");
			resp.sendRedirect(req.getContextPath() + "/dashboard");

		} else if (isCustomer) {
			// Set session and cookie for customer
			Sessionutil.setAttribute(req, "username", username);
			Cookieutil.addCookie(resp, "role", "customer", 30 * 60);
			System.out.println("✅ Customer logged in. Redirecting to home...");
			resp.sendRedirect(req.getContextPath() + "/home");

		} else {
			handleLoginFailure(req, resp, false);
		}
	}

	/**
	 * Handles login failures by setting attributes and forwarding to the login page.
	 */
	private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage;
		if (loginStatus == null) {
			errorMessage = "Our server is under maintenance. Please try again later!";
		} else {
			errorMessage = "User credential mismatch. Please try again!";
		}
		req.setAttribute("error", errorMessage);
		req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
	}
}