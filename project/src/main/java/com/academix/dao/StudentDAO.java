package com.academix.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.academix.model.Student;
import com.academix.model.User;
import com.academix.util.DBConnection;

/**
 * Data Access Object for Student-related database operations
 */
public class StudentDAO {
    
    private UserDAO userDAO = new UserDAO();
    
    /**
     * Create a new student
     * @param student the Student object to create
     * @param user the User object for authentication
     * @return the ID of the created student, or -1 if creation failed
     */
    public int createStudent(Student student, User user) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int studentId = -1;
        
        try {
            // First create the user
            int userId = userDAO.createUser(user);
            
            if (userId > 0) {
                conn = DBConnection.getConnection();
                String sql = "INSERT INTO student (user_id, name, roll_number, email, phone, batch, program, semester) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stmt.setInt(1, userId);
                stmt.setString(2, student.getName());
                stmt.setString(3, student.getRollNumber());
                stmt.setString(4, student.getEmail());
                stmt.setString(5, student.getPhone());
                stmt.setString(6, student.getBatch());
                stmt.setString(7, student.getProgram());
                stmt.setInt(8, student.getSemester());
                
                int affectedRows = stmt.executeUpdate();
                
                if (affectedRows > 0) {
                    rs = stmt.getGeneratedKeys();
                    if (rs.next()) {
                        studentId = rs.getInt(1);
                        student.setId(studentId);
                        student.setUserId(userId);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return studentId;
    }
    
    /**
     * Get a student by ID
     * @param id the student ID
     * @return Student object if found, null otherwise
     */
    public Student getStudentById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Student student = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM student WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                student = new Student();
                student.setId(rs.getInt("id"));
                student.setUserId(rs.getInt("user_id"));
                student.setName(rs.getString("name"));
                student.setRollNumber(rs.getString("roll_number"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setBatch(rs.getString("batch"));
                student.setProgram(rs.getString("program"));
                student.setSemester(rs.getInt("semester"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return student;
    }
    
    /**
     * Get a student by user ID
     * @param userId the user ID
     * @return Student object if found, null otherwise
     */
    public Student getStudentByUserId(int userId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Student student = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM student WHERE user_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                student = new Student();
                student.setId(rs.getInt("id"));
                student.setUserId(rs.getInt("user_id"));
                student.setName(rs.getString("name"));
                student.setRollNumber(rs.getString("roll_number"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setBatch(rs.getString("batch"));
                student.setProgram(rs.getString("program"));
                student.setSemester(rs.getInt("semester"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return student;
    }
    
    /**
     * Get all students
     * @return List of Student objects
     */
    public List<Student> getAllStudents() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Student> students = new ArrayList<>();
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM student";
            stmt = conn.prepareStatement(sql);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setUserId(rs.getInt("user_id"));
                student.setName(rs.getString("name"));
                student.setRollNumber(rs.getString("roll_number"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setBatch(rs.getString("batch"));
                student.setProgram(rs.getString("program"));
                student.setSemester(rs.getInt("semester"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return students;
    }
    
    /**
     * Update a student
     * @param student the Student object to update
     * @return true if update successful, false otherwise
     */
    public boolean updateStudent(Student student) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "UPDATE student SET name = ?, roll_number = ?, email = ?, " +
                         "phone = ?, batch = ?, program = ?, semester = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, student.getName());
            stmt.setString(2, student.getRollNumber());
            stmt.setString(3, student.getEmail());
            stmt.setString(4, student.getPhone());
            stmt.setString(5, student.getBatch());
            stmt.setString(6, student.getProgram());
            stmt.setInt(7, student.getSemester());
            stmt.setInt(8, student.getId());
            
            int affectedRows = stmt.executeUpdate();
            success = (affectedRows > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return success;
    }
    
    /**
     * Delete a student
     * @param id the student ID to delete
     * @return true if deletion successful, false otherwise
     */
    public boolean deleteStudent(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            // Get the student to find the user ID
            Student student = getStudentById(id);
            if (student != null) {
                conn = DBConnection.getConnection();
                
                // First delete the student
                String sql = "DELETE FROM student WHERE id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, id);
                
                int affectedRows = stmt.executeUpdate();
                
                if (affectedRows > 0) {
                    // Then delete the user
                    stmt.close();
                    sql = "DELETE FROM users WHERE id = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, student.getUserId());
                    
                    affectedRows = stmt.executeUpdate();
                    success = (affectedRows > 0);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return success;
    }
}
