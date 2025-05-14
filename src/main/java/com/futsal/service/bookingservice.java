package com.futsal.service;

import com.futsal.config.DbConfig;
import com.futsal.model.bookingmodel;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class bookingservice {

	public void addBooking(bookingmodel booking) {
		String query = "INSERT INTO booking (fullname, contact, booking_date, location, time, payment_status) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection con = DbConfig.getDbConnection();
		     PreparedStatement ps = con.prepareStatement(query)) {

			ps.setString(1, booking.getFullname());
			ps.setString(2, booking.getContact());
			ps.setString(3, booking.getBookingDate());
			ps.setString(4, booking.getLocation());
			ps.setString(5, booking.getTime());
			ps.setString(6, booking.getPaymentStatus());

			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
