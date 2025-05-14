package com.futsal.service;

import com.futsal.config.DbConfig;
import com.futsal.model.customermodel;

import java.sql.*;
import java.util.*;

public class usermanagementservice {

    public List<customermodel> getAllCustomers() {
        List<customermodel> list = new ArrayList<>();
        String query = "SELECT * FROM customer";

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

        	while (rs.next()) {
        	    customermodel c = new customermodel();
        	    c.setCustomerId(rs.getInt("Customer_Id")); // ✅ Set ID
        	    c.setFirstName(rs.getString("FirstName"));
        	    c.setLastName(rs.getString("LastName"));
        	    c.setContact(rs.getString("Contact"));
        	    c.setAddress(rs.getString("Address"));
        	    c.setUsername(rs.getString("Username"));
        	    c.setPassword(rs.getString("Password"));
        	    list.add(c);
        	}


        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addCustomer(customermodel c) {
        String query = "INSERT INTO customer (FirstName, LastName, Contact, Address, Username, Password) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, c.getFirstName());
            ps.setString(2, c.getLastName());
            ps.setString(3, c.getContact());
            ps.setString(4, c.getAddress());
            ps.setString(5, c.getUsername());
            ps.setString(6, c.getPassword());
            ps.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void deleteCustomer(int id) {
        String query = "DELETE FROM customer WHERE Customer_Id = ?";

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
