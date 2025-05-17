// ProductService.java
package com.futsal.service;

import com.futsal.model.productmodel;
import com.futsal.config.DbConfig;
import java.sql.*;
import java.util.*;

public class ProductService {

    public List<productmodel> getAllProducts() {
        List<productmodel> productList = new ArrayList<>();
        String query = "SELECT * FROM product";

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                productmodel p = new productmodel();
                p.setProductId(rs.getInt("Product_ID"));
                p.setProductName(rs.getString("Product_Name"));
                p.setProductPrice(String.valueOf(rs.getBigDecimal("Price")));
                p.setQuantity(String.valueOf(rs.getInt("Quantity")));
                p.setImageUrl(rs.getString("image_url"));
                productList.add(p);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public boolean decreaseQuantityByOne(int productId) {
        String query = "UPDATE product SET Quantity = Quantity - 1 WHERE Product_ID = ? AND Quantity > 0";

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, productId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean createOrder(int productId) {
        String query = "INSERT INTO orders (product_id) VALUES (?)";

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, productId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}