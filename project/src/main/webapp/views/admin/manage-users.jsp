<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp">
    <jsp:param name="title" value="Manage Users" />
    <jsp:param name="css" value="dashboard" />
</jsp:include>

<div class="dashboard-container">
    <jsp:include page="../includes/admin-sidebar.jsp">
        <jsp:param name="active" value="users" />
    </jsp:include>
    
    <div class="main-content">
        <h1 class="page-title">Manage Users</h1>
        
        <!-- Success/Error Messages -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>
        
        <!-- Tabs -->
        <div class="tabs">
            <button class="tab-btn active" onclick="openTab(event, 'students')">Students</button>
            <button class="tab-btn" onclick="openTab(event, 'faculty')">Faculty</button>
            <button class="tab-btn" onclick="openTab(event, 'admins')">Admins</button>
        </div>
        
        <!-- Students Tab -->
        <div id="students" class="tab-content active">
            <div class="tab-header">
                <h2>Student Management</h2>
                <button class="btn btn-primary" onclick="showAddStudentForm()">Add New Student</button>
            </div>
            
            <!-- Student List -->
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Roll Number</th>
                        <th>Email</th>
                        <th>Program</th>
                        <th>Semester</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${students}" var="student">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.name}</td>
                            <td>${student.rollNumber}</td>
                            <td>${student.email}</td>
                            <td>${student.program}</td>
                            <td>${student.semester}</td>
                            <td>
                                <button class="btn-sm btn-secondary" onclick="editStudent(${student.id})">Edit</button>
                                <button class="btn-sm btn-danger" onclick="deleteUser(${student.id}, 'student')">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <!-- Sample data for display -->
                    <tr>
                        <td>1</td>
                        <td>John Doe</td>
                        <td>CS-2025-001</td>
                        <td>john.doe@example.com</td>
                        <td>B.Tech Computer Science</td>
                        <td>3</td>
                        <td>
                            <button class="btn-sm btn-secondary" onclick="editStudent(1)">Edit</button>
                            <button class="btn-sm btn-danger" onclick="deleteUser(1, 'student')">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jane Smith</td>
                        <td>CS-2025-002</td>
                        <td>jane.smith@example.com</td>
                        <td>B.Tech Computer Science</td>
                        <td>3</td>
                        <td>
                            <button class="btn-sm btn-secondary" onclick="editStudent(2)">Edit</button>
                            <button class="btn-sm btn-danger" onclick="deleteUser(2, 'student')">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <!-- Add Student Form (Hidden by default) -->
            <div id="addStudentForm" class="form-container" style="display: none;">
                <h3 class="form-title">Add New Student</h3>
                <form action="${pageContext.request.contextPath}/user-management" method="post">
                    <input type="hidden" name="action" value="createStudent">
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="rollNumber">Roll Number</label>
                            <input type="text" id="rollNumber" name="rollNumber" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="text" id="phone" name="phone" required>
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
                            <label for="batch">Batch</label>
                            <input type="text" id="batch" name="batch" placeholder="e.g., 2020-2024" required>
                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="hideAddStudentForm()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add Student</button>
                    </div>
                </form>
            </div>
            
            <!-- Edit Student Form (Hidden by default) -->
            <div id="editStudentForm" class="form-container" style="display: none;">
                <h3 class="form-title">Edit Student</h3>
                <form action="${pageContext.request.contextPath}/user-management" method="post">
                    <input type="hidden" name="action" value="updateStudent">
                    <input type="hidden" id="editStudentId" name="id" value="">
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="editName">Full Name</label>
                            <input type="text" id="editName" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="editRollNumber">Roll Number</label>
                            <input type="text" id="editRollNumber" name="rollNumber" required readonly>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="editEmail">Email</label>
                            <input type="email" id="editEmail" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="editPhone">Phone</label>
                            <input type="text" id="editPhone" name="phone" required>
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
                            <label for="editBatch">Batch</label>
                            <input type="text" id="editBatch" name="batch" placeholder="e.g., 2020-2024" required>
                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="hideEditStudentForm()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Update Student</button>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Faculty Tab -->
        <div id="faculty" class="tab-content">
            <div class="tab-header">
                <h2>Faculty Management</h2>
                <button class="btn btn-primary" onclick="showAddFacultyForm()">Add New Faculty</button>
            </div>
            
            <!-- Faculty List -->
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Designation</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${faculty}" var="faculty">
                        <tr>
                            <td>${faculty.id}</td>
                            <td>${faculty.name}</td>
                            <td>${faculty.email}</td>
                            <td>${faculty.department}</td>
                            <td>${faculty.designation}</td>
                            <td>
                                <button class="btn-sm btn-secondary" onclick="editFaculty(${faculty.id})">Edit</button>
                                <button class="btn-sm btn-danger" onclick="deleteUser(${faculty.id}, 'faculty')">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <!-- Sample data for display -->
                    <tr>
                        <td>1</td>
                        <td>Dr. Robert Smith</td>
                        <td>robert.smith@example.com</td>
                        <td>Computer Science</td>
                        <td>Professor</td>
                        <td>
                            <button class="btn-sm btn-secondary" onclick="editFaculty(1)">Edit</button>
                            <button class="btn-sm btn-danger" onclick="deleteUser(1, 'faculty')">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Dr. Emily Johnson</td>
                        <td>emily.johnson@example.com</td>
                        <td>Computer Science</td>
                        <td>Associate Professor</td>
                        <td>
                            <button class="btn-sm btn-secondary" onclick="editFaculty(2)">Edit</button>
                            <button class="btn-sm btn-danger" onclick="deleteUser(2, 'faculty')">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <!-- Add Faculty Form (Hidden by default) -->
            <div id="addFacultyForm" class="form-container" style="display: none;">
                <h3 class="form-title">Add New Faculty</h3>
                <form action="${pageContext.request.contextPath}/user-management" method="post">
                    <input type="hidden" name="action" value="createFaculty">
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="facultyName">Full Name</label>
                            <input type="text" id="facultyName" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="facultyEmail">Email</label>
                            <input type="email" id="facultyEmail" name="email" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="facultyPhone">Phone</label>
                            <input type="text" id="facultyPhone" name="phone" required>
                        </div>
                        <div class="form-group">
                            <label for="facultyDepartment">Department</label>
                            <select id="facultyDepartment" name="department" required>
                                <option value="">-- Select Department --</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="Mechanical">Mechanical</option>
                                <option value="Electrical">Electrical</option>
                                <option value="Civil">Civil</option>
                                <option value="Electronics">Electronics</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="facultyDesignation">Designation</label>
                            <select id="facultyDesignation" name="designation" required>
                                <option value="">-- Select Designation --</option>
                                <option value="Professor">Professor</option>
                                <option value="Associate Professor">Associate Professor</option>
                                <option value="Assistant Professor">Assistant Professor</option>
                                <option value="Lecturer">Lecturer</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="hideAddFacultyForm()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add Faculty</button>
                    </div>
                </form>
            </div>
            
            <!-- Edit Faculty Form (Hidden by default) -->
            <div id="editFacultyForm" class="form-container" style="display: none;">
                <h3 class="form-title">Edit Faculty</h3>
                <form action="${pageContext.request.contextPath}/user-management" method="post">
                    <input type="hidden" name="action" value="updateFaculty">
                    <input type="hidden" id="editFacultyId" name="id" value="">
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="editFacultyName">Full Name</label>
                            <input type="text" id="editFacultyName" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="editFacultyEmail">Email</label>
                            <input type="email" id="editFacultyEmail" name="email" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="editFacultyPhone">Phone</label>
                            <input type="text" id="editFacultyPhone" name="phone" required>
                        </div>
                        <div class="form-group">
                            <label for="editFacultyDepartment">Department</label>
                            <select id="editFacultyDepartment" name="department" required>
                                <option value="">-- Select Department --</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="Mechanical">Mechanical</option>
                                <option value="Electrical">Electrical</option>
                                <option value="Civil">Civil</option>
                                <option value="Electronics">Electronics</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="editFacultyDesignation">Designation</label>
                            <select id="editFacultyDesignation" name="designation" required>
                                <option value="">-- Select Designation --</option>
                                <option value="Professor">Professor</option>
                                <option value="Associate Professor">Associate Professor</option>
                                <option value="Assistant Professor">Assistant Professor</option>
                                <option value="Lecturer">Lecturer</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="hideEditFacultyForm()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Update Faculty</button>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Admins Tab -->
        <div id="admins" class="tab-content">
            <div class="tab-header">
                <h2>Admin Management</h2>
                <button class="btn btn-primary" onclick="showAddAdminForm()">Add New Admin</button>
            </div>
            
            <!-- Admin List -->
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${admins}" var="admin">
                        <tr>
                            <td>${admin.id}</td>
                            <td>${admin.name}</td>
                            <td>${admin.email}</td>
                            <td>${admin.phone}</td>
                            <td>
                                <button class="btn-sm btn-secondary" onclick="editAdmin(${admin.id})">Edit</button>
                                <button class="btn-sm btn-danger" onclick="deleteUser(${admin.id}, 'admin')">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <!-- Sample data for display -->
                    <tr>
                        <td>1</td>
                        <td>System Administrator</td>
                        <td>admin@mitpune.edu.in</td>
                        <td>9876543210</td>
                        <td>
                            <button class="btn-sm btn-secondary" onclick="editAdmin(1)">Edit</button>
                            <button class="btn-sm btn-danger" onclick="deleteUser(1, 'admin')">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <!-- Add Admin Form (Hidden by default) -->
            <div id="addAdminForm" class="form-container" style="display: none;">
                <h3 class="form-title">Add New Admin</h3>
                <form action="${pageContext.request.contextPath}/user-management" method="post">
                    <input type="hidden" name="action" value="createAdmin">
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="adminName">Full Name</label>
                            <input type="text" id="adminName" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="adminEmail">Email</label>
                            <input type="email" id="adminEmail" name="email" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="adminPhone">Phone</label>
                            <input type="text" id="adminPhone" name="phone" required>
                        </div>
                        <div class="form-group">
                            <label for="adminUsername">Username</label>
                            <input type="text" id="adminUsername" name="username" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="adminPassword">Password</label>
                            <input type="password" id="adminPassword" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="adminConfirmPassword">Confirm Password</label>
                            <input type="password" id="adminConfirmPassword" name="confirmPassword" required>
                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="hideAddAdminForm()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add Admin</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Tab functionality
    function openTab(evt, tabName) {
        var i, tabContent, tabButtons;
        
        // Hide all tab content
        tabContent = document.getElementsByClassName("tab-content");
        for (i = 0; i < tabContent.length; i++) {
            tabContent[i].style.display = "none";
        }
        
        // Remove active class from all tab buttons
        tabButtons = document.getElementsByClassName("tab-btn");
        for (i = 0; i < tabButtons.length; i++) {
            tabButtons[i].className = tabButtons[i].className.replace(" active", "");
        }
        
        // Show the current tab and add active class to the button
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }
    
    // Student form functions
    function showAddStudentForm() {
        document.getElementById("addStudentForm").style.display = "block";
    }
    
    function hideAddStudentForm() {
        document.getElementById("addStudentForm").style.display = "none";
    }
    
    function editStudent(id) {
        // In a real application, you would fetch the student data from the server
        // For this example, we'll use sample data
        document.getElementById("editStudentId").value = id;
        document.getElementById("editName").value = "John Doe";
        document.getElementById("editRollNumber").value = "CS-2025-001";
        document.getElementById("editEmail").value = "john.doe@example.com";
        document.getElementById("editPhone").value = "1234567890";
        document.getElementById("editProgram").value = "B.Tech Computer Science";
        document.getElementById("editSemester").value = "3";
        document.getElementById("editBatch").value = "2020-2024";
        
        document.getElementById("editStudentForm").style.display = "block";
    }
    
    function hideEditStudentForm() {
        document.getElementById("editStudentForm").style.display = "none";
    }
    
    // Faculty form functions
    function showAddFacultyForm() {
        document.getElementById("addFacultyForm").style.display = "block";
    }
    
    function hideAddFacultyForm() {
        document.getElementById("addFacultyForm").style.display = "none";
    }
    
    function editFaculty(id) {
        // In a real application, you would fetch the faculty data from the server
        // For this example, we'll use sample data
        document.getElementById("editFacultyId").value = id;
        document.getElementById("editFacultyName").value = "Dr. Robert Smith";
        document.getElementById("editFacultyEmail").value = "robert.smith@example.com";
        document.getElementById("editFacultyPhone").value = "1234567890";
        document.getElementById("editFacultyDepartment").value = "Computer Science";
        document.getElementById("editFacultyDesignation").value = "Professor";
        
        document.getElementById("editFacultyForm").style.display = "block";
    }
    
    function hideEditFacultyForm() {
        document.getElementById("editFacultyForm").style.display = "none";
    }
    
    // Admin form functions
    function showAddAdminForm() {
        document.getElementById("addAdminForm").style.display = "block";
    }
    
    function hideAddAdminForm() {
        document.getElementById("addAdminForm").style.display = "none";
    }
    
    // Delete user function
    function deleteUser(id, role) {
        if (confirm("Are you sure you want to delete this " + role + "?")) {
            // In a real application, you would submit a form or make an AJAX request
            // For this example, we'll just show an alert
            alert(role.charAt(0).toUpperCase() + role.slice(1) + " with ID " + id + " deleted successfully.");
        }
    }
    
    // Initialize the first tab as active
    document.getElementsByClassName("tab-btn")[0].click();
</script>

<jsp:include page="../includes/footer.jsp" />
