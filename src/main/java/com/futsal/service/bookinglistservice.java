package com.futsal.service;

import com.futsal.config.DbConfig;
import com.futsal.model.bookingmodel;

import java.sql.*;
import java.util.*;

public class bookinglistservice {

    public List<bookingmodel> getAllBookings() {
        List<bookingmodel> list = new ArrayList<>();
        String query = "SELECT * FROM booking";
        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                bookingmodel b = new bookingmodel();
                b.setId(rs.getInt("id"));
                b.setFullname(rs.getString("fullname"));
                b.setContact(rs.getString("contact"));
                b.setBookingDate(rs.getString("booking_date"));
                b.setLocation(rs.getString("location"));
                b.setTime(rs.getString("time"));
                b.setPaymentStatus(rs.getString("payment_status"));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<bookingmodel> searchBookingsByName(String name) {
        List<bookingmodel> list = new ArrayList<>();
        String query = "SELECT * FROM booking WHERE fullname LIKE ?";
        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                bookingmodel b = new bookingmodel();
                b.setId(rs.getInt("id"));
                b.setFullname(rs.getString("fullname"));
                b.setContact(rs.getString("contact"));
                b.setBookingDate(rs.getString("booking_date"));
                b.setLocation(rs.getString("location"));
                b.setTime(rs.getString("time"));
                b.setPaymentStatus(rs.getString("payment_status"));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public bookingmodel getBookingById(int id) {
        String query = "SELECT * FROM booking WHERE id = ?";
        bookingmodel b = new bookingmodel();
        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                b.setId(rs.getInt("id"));
                b.setFullname(rs.getString("fullname"));
                b.setContact(rs.getString("contact"));
                b.setBookingDate(rs.getString("booking_date"));
                b.setLocation(rs.getString("location"));
                b.setTime(rs.getString("time"));
                b.setPaymentStatus(rs.getString("payment_status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public void addBooking(bookingmodel b) {
        String query = "INSERT INTO booking(fullname, contact, booking_date, location, time, payment_status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, b.getFullname());
            ps.setString(2, b.getContact());
            ps.setString(3, b.getBookingDate());
            ps.setString(4, b.getLocation());
            ps.setString(5, b.getTime());
            ps.setString(6, b.getPaymentStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateBooking(bookingmodel b) {
        String query = "UPDATE booking SET fullname=?, contact=?, booking_date=?, location=?, time=?, payment_status=? WHERE id=?";
        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, b.getFullname());
            ps.setString(2, b.getContact());
            ps.setString(3, b.getBookingDate());
            ps.setString(4, b.getLocation());
            ps.setString(5, b.getTime());
            ps.setString(6, b.getPaymentStatus());
            ps.setInt(7, b.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteBooking(int id) {
        String query = "DELETE FROM booking WHERE id = ?";
        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
