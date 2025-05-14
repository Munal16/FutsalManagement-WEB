package com.futsal.service;

import com.futsal.config.DbConfig;
import java.sql.*;

public class OrderService {
    public boolean placeOrder(int productId /*, int customerId */) {
        String sql = "INSERT INTO orders (product_id) VALUES (?)";

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, productId);
            // ps.setInt(2, customerId); // if customer info available

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}
