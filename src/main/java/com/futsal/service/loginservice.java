package com.futsal.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.futsal.config.DbConfig;
import com.futsal.model.customermodel;
import com.futsal.util.Passwordutil;

/**
 * Service class for handling login operations. Connects to the database,
 * verifies user credentials, and returns login status.
 */
public class loginservice {

	private Connection dbConn;
	private boolean isConnectionError = false;

	/**
	 * Constructor initializes the database connection. Sets the connection error
	 * flag if the connection fails.
	 */
	public loginservice() {
		try {
			dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			isConnectionError = true;
		}
	}

	/**
	 * Validates the user credentials against the database records.
	 *
	 * @param customermodel the customermodel object containing user credentials
	 * @return true if the user credentials are valid, false otherwise; null if a
	 *         connection error occurs
	 */
	public Boolean loginUser(customermodel customermodel) {
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}

		String query = "SELECT Username, password FROM customer WHERE Username = ?";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, customermodel.getUsername());
			ResultSet result = stmt.executeQuery();

			if (result.next()) {
				return validatePassword(result, customermodel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		return false;
		
	}

	/**
	 * Validates the password retrieved from the database.
	 *
	 * @param result       the ResultSet containing the Username and Password from
	 *                     the database
	 * @param customermodel the customermodel object containing user credentials
	 * @return true if the passwords match, false otherwise
	 * @throws SQLException if a database access error occurs
	 */
	private boolean validatePassword(ResultSet result, customermodel customermodel) throws SQLException {
	    String dbUsername = result.getString("username");
	    String dbPassword = result.getString("password");

	    String decryptedPassword = Passwordutil.decrypt(dbPassword, dbUsername);
	    System.out.println("DB Password: " + dbPassword);
	    System.out.println("Decrypted Password: " + decryptedPassword);
	    System.out.println("Entered Password: " + customermodel.getPassword());

	    return dbUsername.equals(customermodel.getUsername()) && decryptedPassword.equals(customermodel.getPassword());
	}

}