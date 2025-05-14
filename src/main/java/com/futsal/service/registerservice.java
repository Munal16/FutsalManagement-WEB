package com.futsal.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.futsal.config.DbConfig;
import com.futsal.model.customermodel;

/**
 * Handles customer registration and database operations.
 */
public class registerservice {

    private Connection dbConn;

    public registerservice() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    /**
     * Adds a new customer to the database.
     *
     * @param customer the customer model containing user input
     * @return true if inserted successfully, false if not, null if connection fails
     */
    public Boolean addCustomer(customermodel customer) {
        if (dbConn == null) {
            System.err.println("Database connection not available.");
            return null;
        }

        String insertQuery = "INSERT INTO customer (FirstName, Contact, Address, LastName, Username, Password) "
                           + "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = dbConn.prepareStatement(insertQuery)) {
            stmt.setString(1, customer.getFirstName());
            stmt.setString(2, customer.getContact());
            stmt.setString(3, customer.getAddress());
            stmt.setString(4, customer.getLastName());
            stmt.setString(5, customer.getUsername());
            stmt.setString(6, customer.getPassword());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("❌ Error inserting customer: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
