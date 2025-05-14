package com.futsal.controller;

import com.futsal.model.productmodel;
import com.futsal.service.productlistService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/productlist")
public class productlistController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final productlistService service = new productlistService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "view";

        switch (action) {
            case "edit" -> {
                int editId = Integer.parseInt(request.getParameter("id"));
                productmodel existing = service.getProductById(editId);
                request.setAttribute("editProduct", existing);
            }
            case "delete" -> {
                int deleteId = Integer.parseInt(request.getParameter("id"));
                service.deleteProduct(deleteId);
            }
        }

        // Reload product list
        List<productmodel> products = service.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/pages/admin/productlist.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String imageUrl = request.getParameter("imageUrl");

        productmodel p = new productmodel();
        p.setProductName(name);
        p.setProductPrice(price);
        p.setQuantity(quantity);
        p.setImageUrl(imageUrl);

        if (idStr == null || idStr.isEmpty()) {
            service.addProduct(p);
        } else {
            p.setProductId(Integer.parseInt(idStr));
            service.updateProduct(p);
        }

        response.sendRedirect("productlist");
    }
}
