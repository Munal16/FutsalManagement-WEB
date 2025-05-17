package com.futsal.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.futsal.util.Cookieutil;
import com.futsal.util.Sessionutil;

@WebServlet(asyncSupported = true, urlPatterns = {"/logout"})
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
          session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/login");
      }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookieutil.deleteCookie(response, "role");
        Sessionutil.invalidateSession(request);
        response.sendRedirect(request.getContextPath() + "/login");
    }

}
