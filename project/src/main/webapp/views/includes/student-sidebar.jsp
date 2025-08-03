<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Student Sidebar -->
<div class="sidebar">
    <div class="sidebar-header">
        <h3>Student Dashboard</h3>
    </div>
    <ul class="sidebar-menu">
        <li><a href="${pageContext.request.contextPath}/views/student/dashboard.jsp" class="${param.active == 'dashboard' ? 'active' : ''}">
            <span class="icon">📊</span> Dashboard
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/student/view-results.jsp" class="${param.active == 'results' ? 'active' : ''}">
            <span class="icon">📝</span> View Results
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/student/download-reports.jsp" class="${param.active == 'reports' ? 'active' : ''}">
            <span class="icon">📄</span> Download Reports
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/student/profile.jsp" class="${param.active == 'profile' ? 'active' : ''}">
            <span class="icon">👤</span> My Profile
        </a></li>
        <li><a href="${pageContext.request.contextPath}/logout">
            <span class="icon">🚪</span> Logout
        </a></li>
    </ul>
</div>
