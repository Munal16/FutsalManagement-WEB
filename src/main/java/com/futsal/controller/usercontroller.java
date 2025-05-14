package com.futsal.controller;

import com.futsal.model.customermodel;
import com.futsal.service.userservice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = {"/user"})
public class usercontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");

        if (username != null) {
            userservice service = new userservice();
            customermodel customer = service.getUserByUsername(username);

            if (customer != null) {
                request.setAttribute("customer", customer);
            }
        }

        request.getRequestDispatcher("/WEB-INF/pages/userprofile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");

        customermodel customer = new customermodel();
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setAddress(address);
        customer.setContact(contact);

        userservice service = new userservice();
        boolean result = service.updateUser(customer);

        if (result) {
            request.setAttribute("message", "Profile updated successfully!");
        } else {
            request.setAttribute("message", "Failed to update profile.");
        }

        // Reload updated data
        customer = service.getUserByUsername(username);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/WEB-INF/pages/userprofile.jsp").forward(request, response);
    }
}
