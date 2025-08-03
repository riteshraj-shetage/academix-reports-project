<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp">
    <jsp:param name="title" value="Manage Subjects" />
    <jsp:param name="css" value="dashboard" />
</jsp:include>

<div class="dashboard-container">
    <jsp:include page="../includes/admin-sidebar.jsp">
        <jsp:param name="active" value="subjects" />
    </jsp:include>
    
    <div class="main-content">
        <h1 class="page-title">Manage Subjects</h1>
        
        <!-- Success/Error Messages -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>
        
        <div class="tab-header">
            <h2>Subject List</h2>
            <button class="btn btn-primary" onclick="showAddSubjectForm()">Add New Subject</button>
        </div>
        
        <!-- Subject List -->
        <table class="data-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Program</th>
                    <th>Semester</th>
                    <th>Max Marks</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${subjects}" var="subject">
                    <tr>
                        <td>${subject.id}</td>
                        <td>${subject.subjectCode}</td>
                        <td>${subject.subjectName}</td>
                        <td>${subject.program}</td>
                        <td>${subject.semester}</td>
                        <td>${subject.maxMarks}</td>
                        <td>
                            <button class="btn-sm btn-secondary" onclick="editSubject(${subject.id})">Edit</button>
                            <button class="btn-sm btn-danger" onclick="deleteSubject(${subject.id})">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
                
                <!-- Sample data for display -->
                <tr>
                    <td>1</td>
                    <td>CS301</td>
                    <td>Database Management Systems</td>
                    <td>B.Tech Computer Science</td>
                    <td>3</td>
                    <td>100</td>
                    <td>
                        <button class="btn-sm btn-secondary" onclick="editSubject(1)">Edit</button>
                        <button class="btn-sm btn-danger" onclick="deleteSubject(1)">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>CS302</td>
                    <td>Web Development</td>
                    <td>B.Tech Computer Science</td>
                    <td>3</td>
                    <td>100</td>
                    <td>
                        <button class="btn-sm btn-secondary" onclick="editSubject(2)">Edit</button>
                        <button class="btn-sm btn-danger" onclick="deleteSubject(2)">Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <!-- Add Subject Form (Hidden by default) -->
        <div id="addSubjectForm" class="form-container" style="display: none;">
            <h3 class="form-title">Add New Subject</h3>
            <form action="${pageContext.request.contextPath}/subject-management" method="post">
                <input type="hidden" name="action" value="createSubject">
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="subjectCode">Subject Code</label>
                        <input type="text" id="subjectCode" name="subjectCode" required>
                    </div>
                    <div class="form-group">
                        <label for="subjectName">Subject Name</label>
                        <input type="text" id="subjectName" name="subjectName" required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="program">Program</label>
                        <select id="program" name="program" required>
                            <option value="">-- Select Program --</option>
                            <option value="B.Tech Computer Science">B.Tech Computer Science</option>
                            <option value="B.Tech Mechanical">B.Tech Mechanical</option>
                            <option value="B.Tech Electrical">B.Tech Electrical</option>
                            <option value="B.Tech Civil">B.Tech Civil</option>
                            <option value="M.Tech Computer Science">M.Tech Computer Science</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="semester">Semester</label>
                        <select id="semester" name="semester" required>
                            <option value="">-- Select Semester --</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="maxMarks">Maximum Marks</label>
                        <input type="number" id="maxMarks" name="maxMarks" min="0" max="100" value="100" required>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="button" class="btn btn-secondary" onclick="hideAddSubjectForm()">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add Subject</button>
                </div>
            </form>
        </div>
        
        <!-- Edit Subject Form (Hidden by default) -->
        <div id="editSubjectForm" class="form-container" style="display: none;">
            <h3 class="form-title">Edit Subject</h3>
            <form action="${pageContext.request.contextPath}/subject-management" method="post">
                <input type="hidden" name="action" value="updateSubject">
                <input type="hidden" id="editSubjectId" name="id" value="">
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="editSubjectCode">Subject Code</label>
                        <input type="text" id="editSubjectCode" name="subjectCode" required>
                    </div>
                    <div class="form-group">
                        <label for="editSubjectName">Subject Name</label>
                        <input type="text" id="editSubjectName" name="subjectName" required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="editProgram">Program</label>
                        <select id="editProgram" name="program" required>
                            <option value="">-- Select Program --</option>
                            <option value="B.Tech Computer Science">B.Tech Computer Science</option>
                            <option value="B.Tech Mechanical">B.Tech Mechanical</option>
                            <option value="B.Tech Electrical">B.Tech Electrical</option>
                            <option value="B.Tech Civil">B.Tech Civil</option>
                            <option value="M.Tech Computer Science">M.Tech Computer Science</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="editSemester">Semester</label>
                        <select id="editSemester" name="semester" required>
                            <option value="">-- Select Semester --</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="editMaxMarks">Maximum Marks</label>
                        <input type="number" id="editMaxMarks" name="maxMarks" min="0" max="100" required>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="button" class="btn btn-secondary" onclick="hideEditSubjectForm()">Cancel</button>
                    <button type="submit" class="btn btn-primary">Update Subject</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // Subject form functions
    function showAddSubjectForm() {
        document.getElementById("addSubjectForm").style.display = "block";
    }
    
    function hideAddSubjectForm() {
        document.getElementById("addSubjectForm").style.display = "none";
    }
    
    function editSubject(id) {
        // In a real application, you would fetch the subject data from the server
        // For this example, we'll use sample data
        document.getElementById("editSubjectId").value = id;
        document.getElementById("editSubjectCode").value = "CS301";
        document.getElementById("editSubjectName").value = "Database Management Systems";
        document.getElementById("editProgram").value = "B.Tech Computer Science";
        document.getElementById("editSemester").value = "3";
        document.getElementById("editMaxMarks").value = "100";
        
        document.getElementById("editSubjectForm").style.display = "block";
    }
    
    function hideEditSubjectForm() {
        document.getElementById("editSubjectForm").style.display = "none";
    }
    
    function deleteSubject(id) {
        if (confirm("Are you sure you want to delete this subject?")) {
            // In a real application, you would submit a form or make an AJAX request
            // For this example, we'll just show an alert
            alert("Subject with ID " + id + " deleted successfully.");
        }
    }
</script>

<jsp:include page="../includes/footer.jsp" />
