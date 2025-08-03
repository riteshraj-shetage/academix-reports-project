<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp">
    <jsp:param name="title" value="View Results" />
    <jsp:param name="css" value="dashboard" />
</jsp:include>

<div class="dashboard-container">
    <jsp:include page="../includes/student-sidebar.jsp">
        <jsp:param name="active" value="results" />
    </jsp:include>
    
    <div class="main-content">
        <h1 class="page-title">View Results</h1>
        
        <!-- Semester Selection -->
        <div class="form-container">
            <form id="semesterForm" action="${pageContext.request.contextPath}/views/student/view-results.jsp" method="get">
                <div class="form-row">
                    <div class="form-group">
                        <label for="semester">Select Semester</label>
                        <select id="semester" name="semester" onchange="this.form.submit()" required>
                            <option value="">-- Select Semester --</option>
                            <option value="1" ${param.semester eq '1' ? 'selected' : ''}>Semester 1</option>
                            <option value="2" ${param.semester eq '2' ? 'selected' : ''}>Semester 2</option>
                            <option value="3" ${param.semester eq '3' ? 'selected' : ''}>Semester 3</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>
        
        <!-- Results Display -->
        <c:if test="${not empty param.semester}">
            <div class="results-container">
                <h2 class="section-title">Semester ${param.semester} Results</h2>
                
                <div class="results-summary">
                    <div class="summary-item">
                        <div class="summary-label">Total Subjects</div>
                        <div class="summary-value">5</div>
                    </div>
                    <div class="summary-item">
                        <div class="summary-label">Total Marks</div>
                        <div class="summary-value">500</div>
                    </div>
                    <div class="summary-item">
                        <div class="summary-label">Marks Obtained</div>
                        <div class="summary-value">427</div>
                    </div>
                    <div class="summary-item">
                        <div class="summary-label">Percentage</div>
                        <div class="summary-value">85.4%</div>
                    </div>
                    <div class="summary-item">
                        <div class="summary-label">SGPA</div>
                        <div class="summary-value">8.5</div>
                    </div>
                </div>
                
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Subject Code</th>
                            <th>Subject Name</th>
                            <th>Max Marks</th>
                            <th>Marks Obtained</th>
                            <th>Percentage</th>
                            <th>Grade</th>
                            <th>Remarks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${results}" var="result">
                            <tr>
                                <td>${result.subject.subjectCode}</td>
                                <td>${result.subject.subjectName}</td>
                                <td>${result.subject.maxMarks}</td>
                                <td>${result.marks}</td>
                                <td>${result.percentage}%</td>
                                <td>${result.grade}</td>
                                <td>${result.remarks}</td>
                            </tr>
                        </c:forEach>
                        
                        <!-- Sample data for display -->
                        <tr>
                            <td>CS301</td>
                            <td>Database Management Systems</td>
                            <td>100</td>
                            <td>85</td>
                            <td>85%</td>
                            <td>A</td>
                            <td>Good performance</td>
                        </tr>
                        <tr>
                            <td>CS302</td>
                            <td>Web Development</td>
                            <td>100</td>
                            <td>92</td>
                            <td>92%</td>
                            <td>A+</td>
                            <td>Excellent work</td>
                        </tr>
                        <tr>
                            <td>CS303</td>
                            <td>Data Structures and Algorithms</td>
                            <td>100</td>
                            <td>78</td>
                            <td>78%</td>
                            <td>B+</td>
                            <td>Can improve</td>
                        </tr>
                        <tr>
                            <td>CS304</td>
                            <td>Operating Systems</td>
                            <td>100</td>
                            <td>88</td>
                            <td>88%</td>
                            <td>A</td>
                            <td>Very good</td>
                        </tr>
                        <tr>
                            <td>CS305</td>
                            <td>Computer Networks</td>
                            <td>100</td>
                            <td>84</td>
                            <td>84%</td>
                            <td>A</td>
                            <td>Good understanding</td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="action-buttons">
                    <a href="${pageContext.request.contextPath}/report-card?studentId=1&semester=${param.semester}" class="btn btn-primary">Download Report Card</a>
                </div>
            </div>
        </c:if>
    </div>
</div>

<style>
    .results-summary {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 30px;
    }
    
    .summary-item {
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        padding: 15px 20px;
        flex: 1;
        min-width: 150px;
        text-align: center;
    }
    
    .summary-label {
        font-size: 0.9rem;
        color: #666;
        margin-bottom: 5px;
    }
    
    .summary-value {
        font-size: 1.5rem;
        font-weight: bold;
        color: var(--primary-color);
    }
</style>

<jsp:include page="../includes/footer.jsp" />
