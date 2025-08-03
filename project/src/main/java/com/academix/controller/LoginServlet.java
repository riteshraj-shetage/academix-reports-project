package com.academix.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.academix.dao.UserDAO;
import com.academix.model.User;

/**
 * Servlet for handling user authentication and login
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private UserDAO userDAO;
    
    public void init() {
        userDAO = new UserDAO();
    }
    
    /**
     * Handle GET requests - redirect to login page
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/views/login.jsp");
    }
    
    /**
     * Handle POST requests - process login form submission
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        // Validate input
        if (username == null || password == null || role == null || 
            username.trim().isEmpty() || password.trim().isEmpty() || role.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please fill in all fields");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }
        
        // Authenticate user
        User user = userDAO.authenticate(username, password, role);
        
        if (user != null) {
            // Create session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRole());
            
            // Redirect based on role
            switch (role) {
                case "admin":
                    response.sendRedirect(request.getContextPath() + "/views/admin/dashboard.jsp");
                    break;
                case "faculty":
                    response.sendRedirect(request.getContextPath() + "/views/faculty/dashboard.jsp");
                    break;
                case "student":
                    response.sendRedirect(request.getContextPath() + "/views/student/dashboard.jsp");
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            }
        } else {
            // Authentication failed
            request.setAttribute("errorMessage", "Invalid credentials. Please try again.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }
}
