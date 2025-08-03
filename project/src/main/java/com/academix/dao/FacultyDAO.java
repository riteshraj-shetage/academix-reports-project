package com.academix.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.academix.model.Faculty;
import com.academix.model.User;
import com.academix.util.DBConnection;

/**
 * Data Access Object for Faculty-related database operations
 */
public class FacultyDAO {
    
    private UserDAO userDAO = new UserDAO();
    
    /**
     * Create a new faculty member
     * @param faculty the Faculty object to create
     * @param user the User object for authentication
     * @return the ID of the created faculty member, or -1 if creation failed
     */
    public int createFaculty(Faculty faculty, User user) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int facultyId = -1;
        
        try {
            // First create the user
            int userId = userDAO.createUser(user);
            
            if (userId > 0) {
                conn = DBConnection.getConnection();
                String sql = "INSERT INTO faculty (user_id, name, email, phone, department, designation) " +
                             "VALUES (?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stmt.setInt(1, userId);
                stmt.setString(2, faculty.getName());
                stmt.setString(3, faculty.getEmail());
                stmt.setString(4, faculty.getPhone());
                stmt.setString(5, faculty.getDepartment());
                stmt.setString(6, faculty.getDesignation());
                
                int affectedRows = stmt.executeUpdate();
                
                if (affectedRows > 0) {
                    rs = stmt.getGeneratedKeys();
                    if (rs.next()) {
                        facultyId = rs.getInt(1);
                        faculty.setId(facultyId);
                        faculty.setUserId(userId);
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
        
        return facultyId;
    }
    
    /**
     * Get a faculty member by ID
     * @param id the faculty ID
     * @return Faculty object if found, null otherwise
     */
    public Faculty getFacultyById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Faculty faculty = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM faculty WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                faculty = new Faculty();
                faculty.setId(rs.getInt("id"));
                faculty.setUserId(rs.getInt("user_id"));
                faculty.setName(rs.getString("name"));
                faculty.setEmail(rs.getString("email"));
                faculty.setPhone(rs.getString("phone"));
                faculty.setDepartment(rs.getString("department"));
                faculty.setDesignation(rs.getString("designation"));
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
        
        return faculty;
    }
    
    /**
     * Get a faculty member by user ID
     * @param userId the user ID
     * @return Faculty object if found, null otherwise
     */
    public Faculty getFacultyByUserId(int userId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Faculty faculty = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM faculty WHERE user_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                faculty = new Faculty();
                faculty.setId(rs.getInt("id"));
                faculty.setUserId(rs.getInt("user_id"));
                faculty.setName(rs.getString("name"));
                faculty.setEmail(rs.getString("email"));
                faculty.setPhone(rs.getString("phone"));
                faculty.setDepartment(rs.getString("department"));
                faculty.setDesignation(rs.getString("designation"));
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
        
        return faculty;
    }
    
    /**
     * Get all faculty members
     * @return List of Faculty objects
     */
    public List<Faculty> getAllFaculty() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Faculty> facultyList = new ArrayList<>();
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM faculty";
            stmt = conn.prepareStatement(sql);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Faculty faculty = new Faculty();
                faculty.setId(rs.getInt("id"));
                faculty.setUserId(rs.getInt("user_id"));
                faculty.setName(rs.getString("name"));
                faculty.setEmail(rs.getString("email"));
                faculty.setPhone(rs.getString("phone"));
                faculty.setDepartment(rs.getString("department"));
                faculty.setDesignation(rs.getString("designation"));
                facultyList.add(faculty);
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
        
        return facultyList;
    }
    
    /**
     * Update a faculty member
     * @param faculty the Faculty object to update
     * @return true if update successful, false otherwise
     */
    public boolean updateFaculty(Faculty faculty) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "UPDATE faculty SET name = ?, email = ?, phone = ?, " +
                         "department = ?, designation = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, faculty.getName());
            stmt.setString(2, faculty.getEmail());
            stmt.setString(3, faculty.getPhone());
            stmt.setString(4, faculty.getDepartment());
            stmt.setString(5, faculty.getDesignation());
            stmt.setInt(6, faculty.getId());
            
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
     * Delete a faculty member
     * @param id the faculty ID to delete
     * @return true if deletion successful, false otherwise
     */
    public boolean deleteFaculty(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            // Get the faculty to find the user ID
            Faculty faculty = getFacultyById(id);
            if (faculty != null) {
                conn = DBConnection.getConnection();
                
                // First delete the faculty
                String sql = "DELETE FROM faculty WHERE id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, id);
                
                int affectedRows = stmt.executeUpdate();
                
                if (affectedRows > 0) {
                    // Then delete the user
                    stmt.close();
                    sql = "DELETE FROM users WHERE id = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, faculty.getUserId());
                    
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
