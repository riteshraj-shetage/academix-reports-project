<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Faculty Sidebar -->
<div class="sidebar">
    <div class="sidebar-header">
        <h3>Faculty Dashboard</h3>
    </div>
    <ul class="sidebar-menu">
        <li><a href="${pageContext.request.contextPath}/views/faculty/dashboard.jsp" class="${param.active == 'dashboard' ? 'active' : ''}">
            <span class="icon">📊</span> Dashboard
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/faculty/manage-results.jsp" class="${param.active == 'results' ? 'active' : ''}">
            <span class="icon">📝</span> Manage Results
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/faculty/view-performance.jsp" class="${param.active == 'performance' ? 'active' : ''}">
            <span class="icon">📈</span> View Performance
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/faculty/generate-reports.jsp" class="${param.active == 'reports' ? 'active' : ''}">
            <span class="icon">📄</span> Generate Reports
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/faculty/profile.jsp" class="${param.active == 'profile' ? 'active' : ''}">
            <span class="icon">👤</span> My Profile
        </a></li>
        <li><a href="${pageContext.request.contextPath}/logout">
            <span class="icon">🚪</span> Logout
        </a></li>
    </ul>
</div>
