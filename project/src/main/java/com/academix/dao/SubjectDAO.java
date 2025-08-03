package com.academix.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.academix.model.Subject;
import com.academix.util.DBConnection;

/**
 * Data Access Object for Subject-related database operations
 */
public class SubjectDAO {
    
    /**
     * Create a new subject
     * @param subject the Subject object to create
     * @return the ID of the created subject, or -1 if creation failed
     */
    public int createSubject(Subject subject) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int subjectId = -1;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO subjects (subject_code, subject_name, semester, program, max_marks) " +
                         "VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, subject.getSubjectCode());
            stmt.setString(2, subject.getSubjectName());
            stmt.setInt(3, subject.getSemester());
            stmt.setString(4, subject.getProgram());
            stmt.setInt(5, subject.getMaxMarks());
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows > 0) {
                rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    subjectId = rs.getInt(1);
                    subject.setId(subjectId);
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
        
        return subjectId;
    }
    
    /**
     * Get a subject by ID
     * @param id the subject ID
     * @return Subject object if found, null otherwise
     */
    public Subject getSubjectById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Subject subject = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM subjects WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setSubjectCode(rs.getString("subject_code"));
                subject.setSubjectName(rs.getString("subject_name"));
                subject.setSemester(rs.getInt("semester"));
                subject.setProgram(rs.getString("program"));
                subject.setMaxMarks(rs.getInt("max_marks"));
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
        
        return subject;
    }
    
    /**
     * Get all subjects
     * @return List of Subject objects
     */
    public List<Subject> getAllSubjects() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Subject> subjects = new ArrayList<>();
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM subjects";
            stmt = conn.prepareStatement(sql);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setSubjectCode(rs.getString("subject_code"));
                subject.setSubjectName(rs.getString("subject_name"));
                subject.setSemester(rs.getInt("semester"));
                subject.setProgram(rs.getString("program"));
                subject.setMaxMarks(rs.getInt("max_marks"));
                subjects.add(subject);
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
        
        return subjects;
    }
    
    /**
     * Get subjects by faculty ID
     * @param facultyId the faculty ID
     * @return List of Subject objects
     */
    public List<Subject> getSubjectsByFacultyId(int facultyId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Subject> subjects = new ArrayList<>();
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT s.* FROM subjects s " +
                         "JOIN faculty_subjects fs ON s.id = fs.subject_id " +
                         "WHERE fs.faculty_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, facultyId);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setSubjectCode(rs.getString("subject_code"));
                subject.setSubjectName(rs.getString("subject_name"));
                subject.setSemester(rs.getInt("semester"));
                subject.setProgram(rs.getString("program"));
                subject.setMaxMarks(rs.getInt("max_marks"));
                subjects.add(subject);
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
        
        return subjects;
    }
    
    /**
     * Assign a subject to a faculty member
     * @param facultyId the faculty ID
     * @param subjectId the subject ID
     * @param academicYear the academic year
     * @return true if assignment successful, false otherwise
     */
    public boolean assignSubjectToFaculty(int facultyId, int subjectId, String academicYear) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO faculty_subjects (faculty_id, subject_id, academic_year) " +
                         "VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, facultyId);
            stmt.setInt(2, subjectId);
            stmt.setString(3, academicYear);
            
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
     * Update a subject
     * @param subject the Subject object to update
     * @return true if update successful, false otherwise
     */
    public boolean updateSubject(Subject subject) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "UPDATE subjects SET subject_code = ?, subject_name = ?, " +
                         "semester = ?, program = ?, max_marks = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, subject.getSubjectCode());
            stmt.setString(2, subject.getSubjectName());
            stmt.setInt(3, subject.getSemester());
            stmt.setString(4, subject.getProgram());
            stmt.setInt(5, subject.getMaxMarks());
            stmt.setInt(6, subject.getId());
            
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
     * Delete a subject
     * @param id the subject ID to delete
     * @return true if deletion successful, false otherwise
     */
    public boolean deleteSubject(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "DELETE FROM subjects WHERE id = ?";
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
