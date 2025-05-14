// ShopNowController.java
package com.futsal.controller;

import com.futsal.model.productmodel;
import com.futsal.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = { "/product" })
public class ProductController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductService service = new ProductService();
        List<productmodel> products = service.getAllProducts();
        request.setAttribute("productList", products);

        // ✅ Move session message to request scope, then remove from session
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("successMessage") != null) {
            request.setAttribute("successMessage", session.getAttribute("successMessage"));
            session.removeAttribute("successMessage");
        }

        request.getRequestDispatcher("/WEB-INF/pages/product.jsp").forward(request, response);
    }
}
