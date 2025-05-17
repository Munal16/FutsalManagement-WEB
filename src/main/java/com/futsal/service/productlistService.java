package com.futsal.service;

import com.futsal.model.productmodel;
import com.futsal.config.DbConfig;

import java.sql.*;
import java.util.*;

public class productlistService {

    public List<productmodel> getAllProducts() {
        List<productmodel> list = new ArrayList<>();
        String query = "SELECT * FROM product";

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                productmodel p = new productmodel();
                p.setProductId(rs.getInt("Product_Id"));
                p.setProductName(rs.getString("Product_Name"));
                p.setProductPrice(rs.getString("Price"));
                p.setQuantity(String.valueOf(rs.getInt("Quantity")));
                p.setImageUrl(rs.getString("image_url"));
                list.add(p);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Log properly in real apps
        }
        return list;
    }

    public void addProduct(productmodel p) {
        String query = "INSERT INTO product(Product_Name, Price, Quantity, image_url) VALUES (?, ?, ?, ?)";

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, p.getProductName());
            ps.setBigDecimal(2, new java.math.BigDecimal(p.getProductPrice()));
            ps.setInt(3, Integer.parseInt(p.getQuantity()));
            ps.setString(4, p.getImageUrl());
            ps.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public productmodel getProductById(int id) {
        String query = "SELECT * FROM product WHERE Product_Id = ?";
        productmodel p = null;

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new productmodel();
                    p.setProductId(rs.getInt("Product_Id"));
                    p.setProductName(rs.getString("Product_Name"));
                    p.setProductPrice(rs.getString("Price"));
                    p.setQuantity(String.valueOf(rs.getInt("Quantity")));
                    p.setImageUrl(rs.getString("image_url"));
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return p;
    }

    public void updateProduct(productmodel p) {
        String query = "UPDATE product SET Product_Name=?, Price=?, Quantity=?, image_url=? WHERE Product_Id=?";

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, p.getProductName());
            ps.setBigDecimal(2, new java.math.BigDecimal(p.getProductPrice()));
            ps.setInt(3, Integer.parseInt(p.getQuantity()));
            ps.setString(4, p.getImageUrl());
            ps.setInt(5, p.getProductId());
            ps.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int id) {
        String query = "DELETE FROM product WHERE Product_Id = ?";

        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}