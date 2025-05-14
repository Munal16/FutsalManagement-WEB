package com.futsal.service;

import com.futsal.config.DbConfig;
import com.futsal.model.customermodel;
import com.futsal.util.Passwordutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userservice {

	public boolean updateUser(customermodel customer) {
	    boolean isUpdated = false;
	    try (Connection conn = DbConfig.getDbConnection()) {
	        String sql = "UPDATE customer SET firstName=?, lastName=?, password=?, address=?, contact=? WHERE username=?";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setString(1, customer.getFirstName());
	        stmt.setString(2, customer.getLastName());

	        // 🔐 Encrypt password using username as key
	        String encryptedPassword = Passwordutil.encrypt(customer.getUsername(), customer.getPassword());
	        stmt.setString(3, encryptedPassword);

	        stmt.setString(4, customer.getAddress());
	        stmt.setString(5, customer.getContact());
	        stmt.setString(6, customer.getUsername());

	        int rows = stmt.executeUpdate();
	        isUpdated = rows > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isUpdated;
	}


	public customermodel getUserByUsername(String username) {
	    customermodel customer = null;
	    try (Connection conn = DbConfig.getDbConnection()) {
	        String sql = "SELECT * FROM customer WHERE username = ?";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setString(1, username);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            customer = new customermodel();
	            customer.setFirstName(rs.getString("FirstName"));
	            customer.setLastName(rs.getString("LastName"));
	            customer.setUsername(rs.getString("Username"));

	            // 🔓 Decrypt password using username
	            String decryptedPassword = Passwordutil.decrypt(rs.getString("Password"), username);
	            customer.setPassword(decryptedPassword);

	            customer.setAddress(rs.getString("Address"));
	            customer.setContact(rs.getString("Contact"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return customer;
	}

}
