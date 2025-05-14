package com.futsal.controller;

import com.futsal.model.bookingmodel;
import com.futsal.service.bookingservice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = {"/booking"})
public class bookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private bookingservice service = new bookingservice();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String contact = request.getParameter("contact");
		String bookingDate = request.getParameter("bookingDate");
		String location = request.getParameter("location");
		String time = request.getParameter("time");
		String payment = request.getParameter("payment");
		String paymentStatus = payment.equalsIgnoreCase("yes") ? "Paid" : "Pending";

		bookingmodel booking = new bookingmodel();
		booking.setFullname(fullname);
		booking.setContact(contact);
		booking.setBookingDate(bookingDate);
		booking.setLocation(location);
		booking.setTime(time);
		booking.setPaymentStatus(paymentStatus);

		service.addBooking(booking);

		request.setAttribute("message", "Booking successful!");
		request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
	}
}
