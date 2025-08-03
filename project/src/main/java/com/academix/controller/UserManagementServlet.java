package com.academix.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.academix.dao.FacultyDAO;
import com.academix.dao.StudentDAO;
import com.academix.dao.UserDAO;
import com.academix.model.Faculty;
import com.academix.model.Student;
import com.academix.model.User;

/**
 * Servlet for handling user management operations
 */
@WebServlet("/user-management")
public class UserManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private UserDAO userDAO;
    private StudentDAO studentDAO;
    private FacultyDAO facultyDAO;
    
    public void init() {
        userDAO = new UserDAO();
        studentDAO = new StudentDAO();
        facultyDAO = new FacultyDAO();
    }
    
    /**
     * Handle GET requests - redirect to user management page
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if user is logged in as admin
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null || 
            !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }
        
        // Forward to user management page
        request.getRequestDispatcher("/views/admin/manage-users.jsp").forward(request, response);
    }
    
    /**
     * Handle POST requests - process user management form submission
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if user is logged in as admin
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null || 
            !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        
        if ("createStudent".equals(action)) {
            createStudent(request, response);
        } else if ("createFaculty".equals(action)) {
            createFaculty(request, response);
        } else if ("updateStudent".equals(action)) {
            updateStudent(request, response);
        } else if ("updateFaculty".equals(action)) {
            updateFaculty(request, response);
        } else if ("deleteUser".equals(action)) {
            deleteUser(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/views/admin/manage-users.jsp");
        }
    }
    
    /**
     * Create a new student
     */
    private void createStudent(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        String name = request.getParameter("name");
        String rollNumber = request.getParameter("rollNumber");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String batch = request.getParameter("batch");
        String program = request.getParameter("program");
        int semester = Integer.parseInt(request.getParameter("semester"));
        
        // Generate username and password
        String username = rollNumber.toLowerCase();
        String password = rollNumber.toLowerCase() + "@123";
        
        // Create user
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole("student");
        
        // Create student
        Student student = new Student();
        student.setName(name);
        student.setRollNumber(rollNumber);
        student.setEmail(email);
        student.setPhone(phone);
        student.setBatch(batch);
        student.setProgram(program);
        student.setSemester(semester);
        
        // Save to database
        int studentId = studentDAO.createStudent(student, user);
        
        if (studentId > 0) {
            request.setAttribute("successMessage", "Student created successfully. Username: " + username + ", Password: " + password);
        } else {
            request.setAttribute("errorMessage", "Failed to create student. Please try again.");
        }
        
        request.getRequestDispatcher("/views/admin/manage-users.jsp").forward(request, response);
    }
    
    /**
     * Create a new faculty member
     */
    private void createFaculty(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");
        String designation = request.getParameter("designation");
        
        // Generate username and password
        String username = name.toLowerCase().replaceAll("\\s+", ".") + "." + department.toLowerCase().substring(0, 3);
        String password = username + "@123";
        
        // Create user
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole("faculty");
        
        // Create faculty
        Faculty faculty = new Faculty();
        faculty.setName(name);
        faculty.setEmail(email);
        faculty.setPhone(phone);
        faculty.setDepartment(department);
        faculty.setDesignation(designation);
        
        // Save to database
        int facultyId = facultyDAO.createFaculty(faculty, user);
        
        if (facultyId > 0) {
            request.setAttribute("successMessage", "Faculty created successfully. Username: " + username + ", Password: " + password);
        } else {
            request.setAttribute("errorMessage", "Failed to create faculty. Please try again.");
        }
        
        request.getRequestDispatcher("/views/admin/manage-users.jsp").forward(request, response);
    }
    
    /**
     * Update an existing student
     */
    private void updateStudent(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String batch = request.getParameter("batch");
        String program = request.getParameter("program");
        int semester = Integer.parseInt(request.getParameter("semester"));
        
        // Get existing student
        Student student = studentDAO.getStudentById(id);
        
        if (student != null) {
            // Update student details
            student.setName(name);
            student.setEmail(email);
            student.setPhone(phone);
            student.setBatch(batch);
            student.setProgram(program);
            student.setSemester(semester);
            
            // Save to database
            boolean success = studentDAO.updateStudent(student);
            
            if (success) {
                request.setAttribute("successMessage", "Student updated successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to update student. Please try again.");
            }
        } else {
            request.setAttribute("errorMessage", "Student not found.");
        }
        
        request.getRequestDispatcher("/views/admin/manage-users.jsp").forward(request, response);
    }
    
    /**
     * Update an existing faculty member
     */
    private void updateFaculty(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");
        String designation = request.getParameter("designation");
        
        // Get existing faculty
        Faculty faculty = facultyDAO.getFacultyById(id);
        
        if (faculty != null) {
            // Update faculty details
            faculty.setName(name);
            faculty.setEmail(email);
            faculty.setPhone(phone);
            faculty.setDepartment(department);
            faculty.setDesignation(designation);
            
            // Save to database
            boolean success = facultyDAO.updateFaculty(faculty);
            
            if (success) {
                request.setAttribute("successMessage", "Faculty updated successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to update faculty. Please try again.");
            }
        } else {
            request.setAttribute("errorMessage", "Faculty not found.");
        }
        
        request.getRequestDispatcher("/views/admin/manage-users.jsp").forward(request, response);
    }
    
    /**
     * Delete a user
     */
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        int id = Integer.parseInt(request.getParameter("id"));
        String role = request.getParameter("role");
        
        boolean success = false;
        
        if ("student".equals(role)) {
            success = studentDAO.deleteStudent(id);
        } else if ("faculty".equals(role)) {
            success = facultyDAO.deleteFaculty(id);
        }
        
        if (success) {
            request.setAttribute("successMessage", "User deleted successfully.");
        } else {
            request.setAttribute("errorMessage", "Failed to delete user. Please try again.");
        }
        
        request.getRequestDispatcher("/views/admin/manage-users.jsp").forward(request, response);
    }
}
