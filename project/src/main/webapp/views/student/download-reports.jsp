<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp">
    <jsp:param name="title" value="Download Reports" />
    <jsp:param name="css" value="dashboard" />
</jsp:include>

<div class="dashboard-container">
    <jsp:include page="../includes/student-sidebar.jsp">
        <jsp:param name="active" value="reports" />
    </jsp:include>
    
    <div class="main-content">
        <h1 class="page-title">Download Reports</h1>
        
        <div class="reports-container">
            <h2 class="section-title">Available Report Cards</h2>
            
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Semester</th>
                        <th>Academic Year</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${reportCards}" var="reportCard">
                        <tr>
                            <td>${reportCard.semester}</td>
                            <td>${reportCard.academicYear}</td>
                            <td>${reportCard.status}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/report-card?studentId=${sessionScope.userId}&semester=${reportCard.semester}" class="btn-sm btn-primary">Download</a>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <!-- Sample data for display -->
                    <tr>
                        <td>1</td>
                        <td>2020-2021</td>
                        <td><span class="status-badge status-published">Published</span></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/report-card?studentId=1&semester=1" class="btn-sm btn-primary">Download</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>2020-2021</td>
                        <td><span class="status-badge status-published">Published</span></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/report-card?studentId=1&semester=2" class="btn-sm btn-primary">Download</a>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>2021-2022</td>
                        <td><span class="status-badge status-published">Published</span></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/report-card?studentId=1&semester=3" class="btn-sm btn-primary">Download</a>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <h2 class="section-title">Other Reports</h2>
            
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Report Type</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Consolidated Marksheet</td>
                        <td>Complete academic record with all semester results</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/consolidated-report?studentId=1" class="btn-sm btn-primary">Download</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Attendance Report</td>
                        <td>Semester-wise attendance record</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/attendance-report?studentId=1" class="btn-sm btn-primary">Download</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Progress Report</td>
                        <td>Academic progress over all semesters</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/progress-report?studentId=1" class="btn-sm btn-primary">Download</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<style>
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
</style>

<jsp:include page="../includes/footer.jsp" />
