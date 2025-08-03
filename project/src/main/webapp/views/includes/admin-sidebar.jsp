<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Admin Sidebar -->
<div class="sidebar">
    <div class="sidebar-header">
        <h3>Admin Dashboard</h3>
    </div>
    <ul class="sidebar-menu">
        <li><a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp" class="${param.active == 'dashboard' ? 'active' : ''}">
            <span class="icon">📊</span> Dashboard
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/admin/manage-users.jsp" class="${param.active == 'users' ? 'active' : ''}">
            <span class="icon">👥</span> Manage Users
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/admin/manage-subjects.jsp" class="${param.active == 'subjects' ? 'active' : ''}">
            <span class="icon">📚</span> Manage Subjects
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/admin/assign-subjects.jsp" class="${param.active == 'assign' ? 'active' : ''}">
            <span class="icon">🔗</span> Assign Subjects
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/admin/view-results.jsp" class="${param.active == 'results' ? 'active' : ''}">
            <span class="icon">📝</span> View Results
        </a></li>
        <li><a href="${pageContext.request.contextPath}/views/admin/generate-reports.jsp" class="${param.active == 'reports' ? 'active' : ''}">
            <span class="icon">📄</span> Generate Reports
        </a></li>
        <li><a href="${pageContext.request.contextPath}/logout">
            <span class="icon">🚪</span> Logout
        </a></li>
    </ul>
</div>
