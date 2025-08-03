<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Academix</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
</head>
<body>
    <!-- Header Section -->
    <header class="header">
        <div class="container header-container">
            <div class="logo-container">
                <!-- Placeholder for institute logo -->
                <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="MIT Pune Logo" class="logo">
                <div class="institute-name">
                    <h1>Modern Institute of Technology, Pune</h1>
                    <p class="tagline">Excellence in Education</p>
                </div>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/views/home.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/about.jsp">About</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/contact.jsp">Contact</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/login.jsp" class="active login-btn">Login</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Login Section -->
    <section class="login-section">
        <div class="container">
            <div class="login-container">
                <div class="login-header">
                    <h2>Login to Academix</h2>
                    <p>Enter your credentials to access your account</p>
                </div>
                
                <form action="${pageContext.request.contextPath}/login" method="post" class="login-form">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="role">Select Role</label>
                        <select id="role" name="role" required>
                            <option value="">-- Select Role --</option>
                            <option value="admin">Admin</option>
                            <option value="faculty">Faculty</option>
                            <option value="student">Student</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="login-button">Login</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-info">
                    <h3>Modern Institute of Technology, Pune</h3>
                    <p>123 Generic Street, Pune, Maharashtra, India</p>
                    <p>Email: info@mitpune.edu.in</p>
                    <p>Phone: +91 1234567890</p>
                </div>
                <div class="footer-links">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/views/home.jsp">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/about.jsp">About</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/contact.jsp">Contact</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/login.jsp">Login</a></li>
                    </ul>
                </div>
            </div>
            <div class="copyright">
                <p>&copy; 2025 mitpune. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>
</html>
