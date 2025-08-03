<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp">
    <jsp:param name="title" value="Manage Results" />
    <jsp:param name="css" value="dashboard" />
</jsp:include>

<div class="dashboard-container">
    <jsp:include page="../includes/faculty-sidebar.jsp">
        <jsp:param name="active" value="results" />
    </jsp:include>
    
    <div class="main-content">
        <h1 class="page-title">Manage Results</h1>
        
        <!-- Success/Error Messages -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>
        
        <!-- Subject Selection -->
        <div class="form-container">
            <form id="subjectForm" action="${pageContext.request.contextPath}/views/faculty/manage-results.jsp" method="get">
                <div class="form-row">
                    <div class="form-group">
                        <label for="subjectId">Select Subject</label>
                        <select id="subjectId" name="subjectId" onchange="this.form.submit()" required>
                            <option value="">-- Select Subject --</option>
                            <c:forEach items="${subjects}" var="subject">
                                <option value="${subject.id}" ${param.subjectId eq subject.id ? 'selected' : ''}>${subject.subjectCode} - ${subject.subjectName}</option>
                            </c:forEach>
                            
                            <!-- Sample data for display -->
                            <option value="1" ${param.subjectId eq '1' ? 'selected' : ''}>CS301 - Database Management Systems</option>
                            <option value="2" ${param.subjectId eq '2' ? 'selected' : ''}>CS302 - Web Development</option>
                            <option value="3" ${param.subjectId eq '3' ? 'selected' : ''}>CS401 - Artificial Intelligence</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>
        
        <!-- Results Management -->
        <c:if test="${not empty param.subjectId}">
            <div class="form-container">
                <h3 class="form-title">Student Results for <span id="subjectName">CS301 - Database Management Systems</span></h3>
                
                <form action="${pageContext.request.contextPath}/result-management" method="post">
                    <input type="hidden" name="action" value="updateResults">
                    <input type="hidden" name="subjectId" value="${param.subjectId}">
                    
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Roll Number</th>
                                <th>Student Name</th>
                                <th>Marks (out of 100)</th>
                                <th>Remarks</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${students}" var="student" varStatus="status">
                                <tr>
                                    <td>${student.rollNumber}</td>
                                    <td>${student.name}</td>
                                    <td>
                                        <input type="hidden" name="studentId_${status.index}" value="${student.id}">
                                        <input type="number" name="marks_${status.index}" value="${results[status.index].marks}" min="0" max="100" required>
                                    </td>
                                    <td>
                                        <input type="text" name="remarks_${status.index}" value="${results[status.index].remarks}">
                                    </td>
                                </tr>
                            </c:forEach>
                            
                            <!-- Sample data for display -->
                            <tr>
                                <td>CS-2025-001</td>
                                <td>John Doe</td>
                                <td>
                                    <input type="hidden" name="studentId_0" value="1">
                                    <input type="number" name="marks_0" value="85" min="0" max="100" required>
                                </td>
                                <td>
                                    <input type="text" name="remarks_0" value="Good performance">
                                </td>
                            </tr>
                            <tr>
                                <td>CS-2025-002</td>
                                <td>Jane Smith</td>
                                <td>
                                    <input type="hidden" name="studentId_1" value="2">
                                    <input type="number" name="marks_1" value="92" min="0" max="100" required>
                                </td>
                                <td>
                                    <input type="text" name="remarks_1" value="Excellent work">
                                </td>
                            </tr>
                            <tr>
                                <td>CS-2025-003</td>
                                <td>Michael Johnson</td>
                                <td>
                                    <input type="hidden" name="studentId_2" value="3">
                                    <input type="number" name="marks_2" value="78" min="0" max="100" required>
                                </td>
                                <td>
                                    <input type="text" name="remarks_2" value="Can improve">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">Save Results</button>
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/views/faculty/dashboard.jsp'">Cancel</button>
                    </div>
                </form>
            </div>
        </c:if>
    </div>
</div>

<script>
    // Update subject name based on selection
    document.addEventListener('DOMContentLoaded', function() {
        const subjectSelect = document.getElementById('subjectId');
        const subjectNameSpan = document.getElementById('subjectName');
        
        if (subjectSelect && subjectNameSpan) {
            const updateSubjectName = function() {
                const selectedOption = subjectSelect.options[subjectSelect.selectedIndex];
                if (selectedOption.value) {
                    subjectNameSpan.textContent = selectedOption.text;
                }
            };
            
            updateSubjectName();
            subjectSelect.addEventListener('change', updateSubjectName);
        }
    });
</script>

<jsp:include page="../includes/footer.jsp" />
