<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp">
    <jsp:param name="title" value="Faculty Dashboard" />
    <jsp:param name="css" value="dashboard" />
</jsp:include>

<div class="dashboard-container">
    <jsp:include page="../includes/faculty-sidebar.jsp">
        <jsp:param name="active" value="dashboard" />
    </jsp:include>
    
    <div class="main-content">
        <h1 class="page-title">Faculty Dashboard</h1>
        
        <div class="dashboard-cards">
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">My Subjects</h2>
                    <div class="dashboard-card-icon">📚</div>
                </div>
                <div class="dashboard-card-value">5</div>
                <div class="dashboard-card-label">Assigned Subjects</div>
            </div>
            
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Students</h2>
                    <div class="dashboard-card-icon">👨‍🎓</div>
                </div>
                <div class="dashboard-card-value">120</div>
                <div class="dashboard-card-label">Under Your Subjects</div>
            </div>
            
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Results</h2>
                    <div class="dashboard-card-icon">📊</div>
                </div>
                <div class="dashboard-card-value">85%</div>
                <div class="dashboard-card-label">Results Published</div>
            </div>
            
            <div class="dashboard-card">
                <div class="dashboard-card-header">
                    <h2 class="dashboard-card-title">Average Score</h2>
                    <div class="dashboard-card-icon">📈</div>
                </div>
                <div class="dashboard-card-value">76.5</div>
                <div class="dashboard-card-label">Across All Subjects</div>
            </div>
        </div>
        
        <h2 class="section-title">My Subjects</h2>
        
        <table class="data-table">
            <thead>
                <tr>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Program</th>
                    <th>Semester</th>
                    <th>Students</th>
                    <th>Results Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${subjects}" var="subject">
                    <tr>
                        <td>${subject.subjectCode}</td>
                        <td>${subject.subjectName}</td>
                        <td>${subject.program}</td>
                        <td>${subject.semester}</td>
                        <td>${subject.studentCount}</td>
                        <td>${subject.resultsStatus}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/views/faculty/manage-results.jsp?subjectId=${subject.id}" class="btn-sm btn-primary">Manage Results</a>
                        </td>
                    </tr>
                </c:forEach>
                
                <!-- Sample data for display -->
                <tr>
                    <td>CS301</td>
                    <td>Database Management Systems</td>
                    <td>B.Tech Computer Science</td>
                    <td>3</td>
                    <td>45</td>
                    <td>Complete</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/views/faculty/manage-results.jsp?subjectId=1" class="btn-sm btn-primary">Manage Results</a>
                    </td>
                </tr>
                <tr>
                    <td>CS302</td>
                    <td>Web Development</td>
                    <td>B.Tech Computer Science</td>
                    <td>3</td>
                    <td>45</td>
                    <td>Incomplete</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/views/faculty/manage-results.jsp?subjectId=2" class="btn-sm btn-primary">Manage Results</a>
                    </td>
                </tr>
                <tr>
                    <td>CS401</td>
                    <td>Artificial Intelligence</td>
                    <td>B.Tech Computer Science</td>
                    <td>4</td>
                    <td>40</td>
                    <td>Not Started</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/views/faculty/manage-results.jsp?subjectId=3" class="btn-sm btn-primary">Manage Results</a>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <h2 class="section-title">Recent Activities</h2>
        
        <table class="data-table">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Activity</th>
                    <th>Subject</th>
                    <th>Details</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2025-05-15</td>
                    <td>Results Updated</td>
                    <td>Database Management Systems</td>
                    <td>45 students' marks updated</td>
                </tr>
                <tr>
                    <td>2025-05-14</td>
                    <td>Report Generated</td>
                    <td>Web Development</td>
                    <td>Class performance report generated</td>
                </tr>
                <tr>
                    <td>2025-05-13</td>
                    <td>Results Started</td>
                    <td>Artificial Intelligence</td>
                    <td>Started entering marks for 40 students</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../includes/footer.jsp" />
