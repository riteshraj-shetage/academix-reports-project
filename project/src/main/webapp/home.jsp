<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Academix - Modern Institute of Technology, Pune</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
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
                    <li><a href="${pageContext.request.contextPath}/views/home.jsp" class="active">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/about.jsp">About</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/contact.jsp">Contact</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/login.jsp" class="login-btn">Login</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <div class="hero-content">
                <h2>Effortlessly Manage Student Results</h2>
                <p>A comprehensive solution for academic result management and reporting</p>
                <a href="${pageContext.request.contextPath}/views/login.jsp" class="cta-button">Login to Academix</a>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="container">
            <h2 class="section-title">Key Features</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">📊</div>
                    <h3>Comprehensive Result Management</h3>
                    <p>Efficiently manage and track student performance across subjects and semesters</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">👥</div>
                    <h3>Role-Based Access</h3>
                    <p>Dedicated dashboards for administrators, faculty, and students</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">📄</div>
                    <h3>Dynamic PDF Reports</h3>
                    <p>Generate and download professional report cards with institutional branding</p>
                </div>
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
                <p>&copy; 2025 Academix. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>
</html>
