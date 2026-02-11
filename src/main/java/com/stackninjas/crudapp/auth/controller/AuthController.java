package com.stackninjas.crudapp.auth.controller;

import com.stackninjas.crudapp.auth.dao.UserDAO;
import com.stackninjas.crudapp.auth.dao.UserDAOImpl;
import com.stackninjas.crudapp.auth.model.User;
import com.stackninjas.crudapp.auth.utils.PasswordUtils;
<<<<<<< Updated upstream
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
=======

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
>>>>>>> Stashed changes

import java.io.IOException;
@WebServlet(urlPatterns = {"/","/auth"})
public class AuthController extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Delegate POST → GET
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "showLogin";

        switch (action) {
            case "showRegister": showRegister(request, response);
                break;
            case "register": registerUser(request, response);
                break;
            case "login": loginUser(request, response);
                break;
            case "logout": logoutUser(request, response);
                break;
            default: showLogin(request, response);
        }
    }

    // ------------------ METHODS ------------------

    private void showLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    private void showRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = new User();
        user.setFullName(request.getParameter("fullName"));
        user.setUsername(request.getParameter("username"));
        user.setPassword(PasswordUtils.hashPassword(request.getParameter("password")));

        userDAO.register(user);

        response.sendRedirect("auth?action=showLogin&success=registered");
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = PasswordUtils.hashPassword(request.getParameter("password"));

        User user = userDAO.login(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", user);
            response.sendRedirect("students?action=list");
        } else {
            response.sendRedirect("auth?action=showLogin&error=invalid");
        }
    }

    private void logoutUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("auth?action=showLogin&logout=true");
    }
}
