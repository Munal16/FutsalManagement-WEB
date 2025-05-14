package com.futsal.controller;

import com.futsal.model.bookingmodel;
import com.futsal.service.bookinglistservice;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/bookinglistController")
public class bookinglistController extends HttpServlet {
    private final bookinglistservice service = new bookinglistservice();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int id;

        // Handle delete or edit actions
        switch (action == null ? "list" : action) {
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                service.deleteBooking(id);
                response.sendRedirect("bookinglistController?action=list");
                break;

            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                bookingmodel editBooking = service.getBookingById(id);
                request.setAttribute("booking", editBooking);
                request.getRequestDispatcher("editbooking.jsp").forward(request, response);
                break;

            case "list":
            default:
                // Handle search query if available
                String searchName = request.getParameter("searchName");
                List<bookingmodel> bookings;
                if (searchName != null && !searchName.trim().isEmpty()) {
                    bookings = service.searchBookingsByName(searchName);
                } else {
                    bookings = service.getAllBookings();
                }
                request.setAttribute("bookings", bookings);
                request.getRequestDispatcher("/WEB-INF/pages/admin/booking list.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        bookingmodel b = new bookingmodel();
        b.setFullname(request.getParameter("fullname"));
        b.setContact(request.getParameter("contact"));
        b.setBookingDate(request.getParameter("bookingDate"));
        b.setLocation(request.getParameter("location"));
        b.setTime(request.getParameter("time"));
        b.setPaymentStatus(request.getParameter("paymentStatus"));

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            service.addBooking(b);
        } else {
            b.setId(Integer.parseInt(idStr));
            service.updateBooking(b);
        }

        response.sendRedirect("bookinglistController?action=list");
    }
}
