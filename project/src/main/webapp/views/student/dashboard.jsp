<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp">
    <jsp:param name="title" value="Student Dashboard" />
    <jsp:param name="css" value="dashboard" />
</jsp:include>

<div class="dashboard-container">
    <jsp:include page="../includes/student-sidebar.jsp">
        <jsp:param name="active" value="dashboard" />
    </jsp:include>
    
    <div class="main-content">
        <h1 class="page-title">Student Dashboard</h1>
        
        <!-- Student Information -->
        <div class="student-info-card">
            <div class="student-info-header">
                <h2>Student Information</h2>
            </div>
            <div class="student-info-content">
                <div class="student-info-row">
                    <div class="student-info-label">Name:</div>
                    <div class="student-info-value">John Doe</div>
                </div>
                <div class="student-info-row">
                    <div class="student-info-label">Roll Number:</div>
                    <div class="student-info-value">CS-2025-001</div>
                </div>
                <div class="student-info-row">
                    <div class="student-info-label">Program:</div>
                    <div class="student-info-value">B.Tech Computer Science</div>
                </div>
                <div class="student-info-row">
                    <div class="student-info-label">Semester:</div>
                    <div class="student-info-value">3</div>
                </div>
                <div class="student-info-row">
                    <div class="student-info-label">Batch:</div>
                    <div class="student-info-value">2020-2024</div>
                </div>
            </div>
        </div>
        
        <div class="dashboard-cards">
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Current Semester</h2>
                    <div class="dashboard-card-icon">📚</div>
                </div>
                <div class="dashboard-card-value">3</div>
                <div class="dashboard-card-label">Semester</div>
            </div>
            
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Subjects</h2>
                    <div class="dashboard-card-icon">📖</div>
                </div>
                <div class="dashboard-card-value">5</div>
                <div class="dashboard-card-label">Current Subjects</div>
            </div>
            
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Average Score</h2>
                    <div class="dashboard-card-icon">📊</div>
                </div>
                <div class="dashboard-card-value">85.5%</div>
                <div class="dashboard-card-label">Current Semester</div>
            </div>
            
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">CGPA</h2>
                    <div class="dashboard-card-icon">🎓</div>
                </div>
                <div class="dashboard-card-value">8.7</div>
                <div class="dashboard-card-label">Cumulative GPA</div>
            </div>
        </div>
        
        <h2 class="section-title">Current Semester Subjects</h2>
        
        <table class="data-table">
            <thead>
                <tr>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Max Marks</th>
                    <th>Marks Obtained</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${subjects}" var="subject">
                    <tr>
                        <td>${subject.subjectCode}</td>
                        <td>${subject.subjectName}</td>
                        <td>${subject.maxMarks}</td>
                        <td>${subject.marksObtained}</td>
                        <td>${subject.status}</td>
                    </tr>
                </c:forEach>
                
                <!-- Sample data for display -->
                <tr>
                    <td>CS301</td>
                    <td>Database Management Systems</td>
                    <td>100</td>
                    <td>85</td>
                    <td><span class="status-badge status-published">Published</span></td>
                </tr>
                <tr>
                    <td>CS302</td>
                    <td>Web Development</td>
                    <td>100</td>
                    <td>92</td>
                    <td><span class="status-badge status-published">Published</span></td>
                </tr>
                <tr>
                    <td>CS303</td>
                    <td>Data Structures and Algorithms</td>
                    <td>100</td>
                    <td>78</td>
                    <td><span class="status-badge status-published">Published</span></td>
                </tr>
                <tr>
                    <td>CS304</td>
                    <td>Operating Systems</td>
                    <td>100</td>
                    <td>88</td>
                    <td><span class="status-badge status-published">Published</span></td>
                </tr>
                <tr>
                    <td>CS305</td>
                    <td>Computer Networks</td>
                    <td>100</td>
                    <td>-</td>
                    <td><span class="status-badge status-pending">Pending</span></td>
                </tr>
            </tbody>
        </table>
        
        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/views/student/view-results.jsp" class="btn btn-primary">View Detailed Results</a>
            <a href="${pageContext.request.contextPath}/report-card?studentId=1" class="btn btn-secondary">Download Report Card</a>
        </div>
    </div>
</div>

<style>
    .student-info-card {
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        margin-bottom: 30px;
    }
    
    .student-info-header {
        padding: 15px 20px;
        border-bottom: 1px solid #eee;
    }
    
    .student-info-header h2 {
        margin: 0;
        font-size: 1.3rem;
        color: var(--primary-color);
    }
    
    .student-info-content {
        padding: 20px;
    }
    
    .student-info-row {
        display: flex;
        margin-bottom: 10px;
    }
    
    .student-info-label {
        font-weight: 500;
        width: 150px;
        color: var(--text-color);
    }
    
    .student-info-value {
        flex: 1;
    }
    
    .status-badge {
        display: inline-block;
        padding: 5px 10px;
        border-radius: 4px;
        font-size: 0.8rem;
        font-weight: 500;
    }
    
    .status-published {
        background-color: #d4edda;
        color: #155724;
    }
    
    .status-pending {
        background-color: #fff3cd;
        color: #856404;
    }
    
    .action-buttons {
        margin-top: 30px;
        display: flex;
        gap: 15px;
    }
</style>

<jsp:include page="../includes/footer.jsp" />
