<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/error.css">
</head>
<body>
    <div class="error-container">
        <div class="error-content">
            <div class="error-code">404</div>
            <h1 class="error-title">Page Not Found</h1>
            <p class="error-message">The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.</p>
            <div class="error-actions">
                <a href="${pageContext.request.contextPath}/views/home.jsp" class="btn-primary">Go to Homepage</a>
                <a href="javascript:history.back()" class="btn-secondary">Go Back</a>
            </div>
        </div>
    </div>
</body>
</html>
