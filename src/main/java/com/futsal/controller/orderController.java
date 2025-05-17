package com.futsal.controller;

import com.futsal.service.ProductService;
import com.futsal.service.OrderService;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/order")
public class orderController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductService productService = new ProductService();
        OrderService orderService = new OrderService();

        boolean quantityUpdated = productService.decreaseQuantityByOne(productId);

        if (quantityUpdated) {
            boolean orderStored = orderService.placeOrder(productId);

            if (orderStored) {
                HttpSession session = request.getSession();
                session.setAttribute("successMessage", "Order placed successfully!");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("successMessage", "Order placed, but not recorded!");
            }

            response.sendRedirect(request.getContextPath() + "/product");

        } else {
            request.setAttribute("errorMessage", "Failed to place order.");
            request.getRequestDispatcher("/WEB-INF/pages/product.jsp").forward(request, response);
        }
    }
}