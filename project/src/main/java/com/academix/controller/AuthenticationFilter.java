package com.academix.controller;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Filter for authentication and role-based access control
 */
@WebFilter(urlPatterns = {"/views/admin/*", "/views/faculty/*", "/views/student/*"})
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        String requestURI = httpRequest.getRequestURI();
        
        // Check if user is logged in
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        boolean isLoginPage = requestURI.contains("login.jsp");
        boolean isHomePage = requestURI.endsWith("home.jsp");
        boolean isStaticResource = requestURI.contains("/assets/");
        
        if (isLoggedIn || isLoginPage || isHomePage || isStaticResource) {
            // User is logged in or accessing public resources
            
            // Check role-based access
            if (isLoggedIn && !isStaticResource) {
                String role = (String) session.getAttribute("role");
                
                if (requestURI.contains("/admin/") && !"admin".equals(role)) {
                    // Redirect non-admin users trying to access admin pages
                    httpResponse.setContentType("text/html");
                    httpResponse.getWriter().println("<script type='text/javascript'>");
                    httpResponse.getWriter().println("window.alert('Unauthorized access. Admin privileges required.');");
                    httpResponse.getWriter().println("window.location.href='" + httpRequest.getContextPath() + "/views/login.jsp';");
                    httpResponse.getWriter().println("</script>");
                    return;
                } else if (requestURI.contains("/faculty/") && !"faculty".equals(role)) {
                    // Redirect non-faculty users trying to access faculty pages
                    httpResponse.setContentType("text/html");
                    httpResponse.getWriter().println("<script type='text/javascript'>");
                    httpResponse.getWriter().println("window.alert('Unauthorized access. Faculty privileges required.');");
                    httpResponse.getWriter().println("window.location.href='" + httpRequest.getContextPath() + "/views/login.jsp';");
                    httpResponse.getWriter().println("</script>");
                    return;
                } else if (requestURI.contains("/student/") && !"student".equals(role)) {
                    // Redirect non-student users trying to access student pages
                    httpResponse.setContentType("text/html");
                    httpResponse.getWriter().println("<script type='text/javascript'>");
                    httpResponse.getWriter().println("window.alert('Unauthorized access. Student privileges required.');");
                    httpResponse.getWriter().println("window.location.href='" + httpRequest.getContextPath() + "/views/login.jsp';");
                    httpResponse.getWriter().println("</script>");
                    return;
                }
            }
            
            // Continue with the request
            chain.doFilter(request, response);
        } else {
            // User is not logged in and trying to access protected resources
            httpResponse.setContentType("text/html");
            httpResponse.getWriter().println("<script type='text/javascript'>");
            httpResponse.getWriter().println("window.alert('Please login to access this page.');");
            httpResponse.getWriter().println("window.location.href='" + httpRequest.getContextPath() + "/views/login.jsp';");
            httpResponse.getWriter().println("</script>");
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
