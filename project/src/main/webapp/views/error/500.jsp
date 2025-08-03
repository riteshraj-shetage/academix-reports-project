<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 - Internal Server Error</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/error.css">
</head>
<body>
    <div class="error-container">
        <div class="error-content">
            <div class="error-code">500</div>
            <h1 class="error-title">Internal Server Error</h1>
            <p class="error-message">Sorry, something went wrong on our server. We're working to fix the issue.</p>
            <div class="error-actions">
                <a href="${pageContext.request.contextPath}/views/home.jsp" class="btn-primary">Go to Homepage</a>
                <a href="javascript:history.back()" class="btn-secondary">Go Back</a>
            </div>
            
            <% if (exception != null) { %>
            <div class="error-details">
                <h3>Error Details:</h3>
                <p><%= exception.getMessage() %></p>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>
