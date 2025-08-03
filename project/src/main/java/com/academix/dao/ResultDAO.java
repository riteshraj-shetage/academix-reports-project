package com.academix.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.academix.model.Result;
import com.academix.model.Subject;
import com.academix.util.DBConnection;

/**
 * Data Access Object for Result-related database operations
 */
public class ResultDAO {
    
    private SubjectDAO subjectDAO = new SubjectDAO();
    
    /**
     * Create a new result
     * @param result the Result object to create
     * @return the ID of the created result, or -1 if creation failed
     */
    public int createResult(Result result) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int resultId = -1;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO results (student_id, subject_id, marks, exam_date, academic_year, remarks) " +
                         "VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, result.getStudentId());
            stmt.setInt(2, result.getSubjectId());
            stmt.setDouble(3, result.getMarks());
            stmt.setDate(4, result.getExamDate() != null ? new java.sql.Date(result.getExamDate().getTime()) : null);
            stmt.setString(5, result.getAcademicYear());
            stmt.setString(6, result.getRemarks());
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows > 0) {
                rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    resultId = rs.getInt(1);
                    result.setId(resultId);
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
        
        return resultId;
    }
    
    /**
     * Get a result by ID
     * @param id the result ID
     * @return Result object if found, null otherwise
     */
    public Result getResultById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Result result = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM results WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                result = new Result();
                result.setId(rs.getInt("id"));
                result.setStudentId(rs.getInt("student_id"));
                result.setSubjectId(rs.getInt("subject_id"));
                result.setMarks(rs.getDouble("marks"));
                result.setExamDate(rs.getDate("exam_date"));
                result.setAcademicYear(rs.getString("academic_year"));
                result.setRemarks(rs.getString("remarks"));
                
                // Load subject details
                Subject subject = subjectDAO.getSubjectById(result.getSubjectId());
                result.setSubject(subject);
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
        
        return result;
    }
    
    /**
     * Get results by student ID
     * @param studentId the student ID
     * @return List of Result objects
     */
    public List<Result> getResultsByStudentId(int studentId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Result> results = new ArrayList<>();
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM results WHERE student_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, studentId);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Result result = new Result();
                result.setId(rs.getInt("id"));
                result.setStudentId(rs.getInt("student_id"));
                result.setSubjectId(rs.getInt("subject_id"));
                result.setMarks(rs.getDouble("marks"));
                result.setExamDate(rs.getDate("exam_date"));
                result.setAcademicYear(rs.getString("academic_year"));
                result.setRemarks(rs.getString("remarks"));
                
                // Load subject details
                Subject subject = subjectDAO.getSubjectById(result.getSubjectId());
                result.setSubject(subject);
                
                results.add(result);
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
        
        return results;
    }
    
    /**
     * Get results by subject ID
     * @param subjectId the subject ID
     * @return List of Result objects
     */
    public List<Result> getResultsBySubjectId(int subjectId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Result> results = new ArrayList<>();
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM results WHERE subject_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, subjectId);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Result result = new Result();
                result.setId(rs.getInt("id"));
                result.setStudentId(rs.getInt("student_id"));
                result.setSubjectId(rs.getInt("subject_id"));
                result.setMarks(rs.getDouble("marks"));
                result.setExamDate(rs.getDate("exam_date"));
                result.setAcademicYear(rs.getString("academic_year"));
                result.setRemarks(rs.getString("remarks"));
                
                // Load subject details
                Subject subject = subjectDAO.getSubjectById(result.getSubjectId());
                result.setSubject(subject);
                
                results.add(result);
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
        
        return results;
    }
    
    /**
     * Update a result
     * @param result the Result object to update
     * @return true if update successful, false otherwise
     */
    public boolean updateResult(Result result) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "UPDATE results SET marks = ?, exam_date = ?, " +
                         "academic_year = ?, remarks = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setDouble(1, result.getMarks());
            stmt.setDate(2, result.getExamDate() != null ? new java.sql.Date(result.getExamDate().getTime()) : null);
            stmt.setString(3, result.getAcademicYear());
            stmt.setString(4, result.getRemarks());
            stmt.setInt(5, result.getId());
            
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
     * Delete a result
     * @param id the result ID to delete
     * @return true if deletion successful, false otherwise
     */
    public boolean deleteResult(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "DELETE FROM results WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            
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
}
