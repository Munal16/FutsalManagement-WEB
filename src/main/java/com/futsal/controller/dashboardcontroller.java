package com.futsal.controller;

import com.futsal.model.bookingmodel;
import com.futsal.config.DbConfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = { "/dashboard" })
public class dashboardcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<bookingmodel> bookings = new ArrayList<>();

        try (Connection conn = DbConfig.getDbConnection()) {
            String sql = "SELECT * FROM booking WHERE booking_date >= CURDATE() ORDER BY booking_date ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                bookingmodel booking = new bookingmodel();
                booking.setId(rs.getInt("id"));
                booking.setFullname(rs.getString("fullname"));
                booking.setContact(rs.getString("contact"));
                booking.setBookingDate(rs.getString("booking_date"));
                booking.setLocation(rs.getString("location"));
                booking.setTime(rs.getString("time"));
                booking.setPaymentStatus(rs.getString("payment_status"));
                bookings.add(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("bookings", bookings);
        req.getRequestDispatcher("/WEB-INF/pages/dashboard.jsp").forward(req, resp);
    }
}
