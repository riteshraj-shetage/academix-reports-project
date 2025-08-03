<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title} - Academix</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/about-contact.css">
    <c:if test="${not empty param.css}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/${param.css}.css">
    </c:if>
</head>
<body>
    <!-- Header Section -->
    <header class="header">
        <div class="container header-container">
            <div class="logo-container">
                <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="MIT Pune Logo" class="logo">
                <div class="institute-name">
                    <h1>Modern Institute of Technology, Pune</h1>
                    <p class="tagline">Excellence in Education</p>
                </div>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/views/home.jsp" class="${param.active == 'home' ? 'active' : ''}">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/about.jsp" class="${param.active == 'about' ? 'active' : ''}">About</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/contact.jsp" class="${param.active == 'contact' ? 'active' : ''}">Contact</a></li>
                    
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            <li><a href="${pageContext.request.contextPath}/views/login.jsp" class="${param.active == 'login' ? 'active' : ''} login-btn">Login</a></li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="#" class="user-menu">
                                    Welcome, ${sessionScope.username} (${sessionScope.role})
                                </a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </div>
    </header>
