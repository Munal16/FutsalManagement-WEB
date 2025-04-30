package com.futsal.controller;

import java.io.IOException;

import com.futsal.config.DbConfig;
import com.futsal.model.customermodel;
import com.futsal.service.registerservice;
import com.futsal.util.Passwordutil;
import com.futsal.util.Validationutil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/register", "/" })
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final registerservice registerservice = new registerservice();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!DbConfig.isDbConnected()) {
            handleError(req, resp, "Database connection failed. Please try again later.");
            return;
        }
        req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!DbConfig.isDbConnected()) {
            handleError(req, resp, "Database connection failed. Please try again later.");
            return;
        }

        try {
            String validationMessage = validateRegistrationForm(req);
            if (validationMessage != null) {
                handleError(req, resp, validationMessage);
                return;
            }

            customermodel customer = extractCustomerModel(req);
            Boolean isAdded = registerservice.addCustomer(customer);

            if (isAdded == null) {
                handleError(req, resp, "Server maintenance in progress. Try again later!");
            } else if (isAdded) {
                handleSuccess(req, resp, "Account created successfully!", "/WEB-INF/pages/login.jsp");
            } else {
                handleError(req, resp, "Could not register account. Try again later!");
            }
        } catch (Exception e) {
            handleError(req, resp, "Unexpected error occurred.");
            e.printStackTrace();
        }
    }

    private String validateRegistrationForm(HttpServletRequest req) {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String username = req.getParameter("username");
        String contact = req.getParameter("contact");
        String address = req.getParameter("address");
        String password = req.getParameter("password");

        if (Validationutil.isNullOrEmpty(firstName)) return "First name is required.";
        if (Validationutil.isNullOrEmpty(lastName)) return "Last name is required.";
        if (Validationutil.isNullOrEmpty(username)) return "Username is required.";
        if (Validationutil.isNullOrEmpty(contact)) return "Contact number is required.";
        if (Validationutil.isNullOrEmpty(address)) return "Address is required.";
        if (Validationutil.isNullOrEmpty(password)) return "Password is required.";

        if (!Validationutil.isAlphanumericStartingWithLetter(username))
            return "Username must start with a letter and contain only letters and numbers.";
        if (!Validationutil.isValidPhoneNumber(contact))
            return "Phone number must be 10 digits and start with 98.";
        if (!Validationutil.isValidPassword(password))
            return "Password must be at least 8 characters, including an uppercase letter, a number, and a symbol.";

        return null;
    }

    private customermodel extractCustomerModel(HttpServletRequest req) throws Exception {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String username = req.getParameter("username");
        String contact = req.getParameter("contact");
        String address = req.getParameter("address");
        String password = req.getParameter("password");

        password = Passwordutil.encrypt(username, password);

        customermodel customer = new customermodel();
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setUsername(username);
        customer.setContact(contact);
        customer.setAddress(address);
        customer.setPassword(password);

        return customer;
    }

    private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
            throws ServletException, IOException {
        req.setAttribute("success", message);
        req.getRequestDispatcher(redirectPage).forward(req, resp);
    }

    private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
            throws ServletException, IOException {
        req.setAttribute("error", message);
        req.setAttribute("firstName", req.getParameter("firstName"));
        req.setAttribute("lastName", req.getParameter("lastName"));
        req.setAttribute("username", req.getParameter("username"));
        req.setAttribute("contact", req.getParameter("contact"));
        req.setAttribute("address", req.getParameter("address"));
        req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);
    }
}
