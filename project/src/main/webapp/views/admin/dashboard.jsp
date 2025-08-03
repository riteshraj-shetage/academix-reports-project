<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp">
    <jsp:param name="title" value="Admin Dashboard" />
    <jsp:param name="css" value="dashboard" />
</jsp:include>

<div class="dashboard-container">
    <jsp:include page="../includes/admin-sidebar.jsp">
        <jsp:param name="active" value="dashboard" />
    </jsp:include>
    
    <div class="main-content">
        <h1 class="page-title">Admin Dashboard</h1>
        
        <div class="dashboard-cards">
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Total Students</h2>
                    <div class="dashboard-card-icon">👨‍🎓</div>
                </div>
                <div class="dashboard-card-value">250</div>
                <div class="dashboard-card-label">Enrolled Students</div>
            </div>
            
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Total Faculty</h2>
                    <div class="dashboard-card-icon">👨‍🏫</div>
                </div>
                <div class="dashboard-card-value">45</div>
                <div class="dashboard-card-label">Teaching Staff</div>
            </div>
            
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Total Subjects</h2>
                    <div class="dashboard-card-icon">📚</div>
                </div>
                <div class="dashboard-card-value">32</div>
                <div class="dashboard-card-label">Active Courses</div>
            </div>
            
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Results Published</h2>
                    <div class="dashboard-card-icon">📊</div>
                </div>
                <div class="dashboard-card-value">85%</div>
                <div class="dashboard-card-label">Completion Rate</div>
            </div>
        </div>
        
        <h2 class="section-title">Recent Activities</h2>
        
        <table class="data-table">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Activity</th>
                    <th>User</th>
                    <th>Details</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2025-05-15</td>
                    <td>New Student Added</td>
                    <td>Admin</td>
                    <td>John Doe (CS-2025-001)</td>
                </tr>
                <tr>
                    <td>2025-05-14</td>
                    <td>Result Updated</td>
                    <td>Prof. Smith</td>
                    <td>Database Management (CS301)</td>
                </tr>
                <tr>
                    <td>2025-05-14</td>
                    <td>New Faculty Added</td>
                    <td>Admin</td>
                    <td>Dr. Jane Wilson (Computer Science)</td>
                </tr>
                <tr>
                    <td>2025-05-13</td>
                    <td>Subject Assigned</td>
                    <td>Admin</td>
                    <td>Web Development (CS302) to Prof. Johnson</td>
                </tr>
                <tr>
                    <td>2025-05-12</td>
                    <td>Report Generated</td>
                    <td>Admin</td>
                    <td>Semester Performance Report</td>
                </tr>
            </tbody>
        </table>
        
        <h2 class="section-title">Performance Overview</h2>
        
        <div class="dashboard-cards">
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Average Score</h2>
                </div>
                <div class="dashboard-card-value">76.5%</div>
                <div class="dashboard-card-label">Across All Subjects</div>
            </div>
            
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Pass Rate</h2>
                </div>
                <div class="dashboard-card-value">92%</div>
                <div class="dashboard-card-label">Students Passing</div>
            </div>
            
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Top Department</h2>
                </div>
                <div class="dashboard-card-value">Computer Science</div>
                <div class="dashboard-card-label">Average: 82.3%</div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../includes/footer.jsp" />
