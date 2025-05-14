package com.futsal.controller;

import com.futsal.model.customermodel;
import com.futsal.service.usermanagementservice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/usermanagement")
public class usermanagementController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final usermanagementservice service = new usermanagementservice();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "view";

        switch (action) {
            case "delete" -> {
                int deleteId = Integer.parseInt(request.getParameter("id"));
                service.deleteCustomer(deleteId);
            }
        }

        List<customermodel> customers = service.getAllCustomers();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/WEB-INF/pages/admin/usermanagement.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        customermodel c = new customermodel();
        c.setFirstName(request.getParameter("firstname"));
        c.setLastName(request.getParameter("lastname"));
        c.setContact(request.getParameter("contact"));
        c.setAddress(request.getParameter("address"));
        c.setUsername(request.getParameter("username"));
        c.setPassword(request.getParameter("password"));

        service.addCustomer(c);
        response.sendRedirect("usermanagement");
    }
}
