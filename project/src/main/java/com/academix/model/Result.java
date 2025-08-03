package com.academix.model;

import java.util.Date;

/**
 * Model class representing a student's result for a subject
 */
public class Result {
    private int id;
    private int studentId;
    private int subjectId;
    private double marks;
    private Date examDate;
    private String academicYear;
    private String remarks;
    private Subject subject; // To hold subject details
    
    // Default constructor
    public Result() {
    }
    
    // Parameterized constructor
    public Result(int id, int studentId, int subjectId, double marks, 
                 Date examDate, String academicYear, String remarks) {
        this.id = id;
        this.studentId = studentId;
        this.subjectId = subjectId;
        this.marks = marks;
        this.examDate = examDate;
        this.academicYear = academicYear;
        this.remarks = remarks;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getStudentId() {
        return studentId;
    }
    
    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }
    
    public int getSubjectId() {
        return subjectId;
    }
    
    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }
    
    public double getMarks() {
        return marks;
    }
    
    public void setMarks(double marks) {
        this.marks = marks;
    }
    
    public Date getExamDate() {
        return examDate;
    }
    
    public void setExamDate(Date examDate) {
        this.examDate = examDate;
    }
    
    public String getAcademicYear() {
        return academicYear;
    }
    
    public void setAcademicYear(String academicYear) {
        this.academicYear = academicYear;
    }
    
    public String getRemarks() {
        return remarks;
    }
    
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    public Subject getSubject() {
        return subject;
    }
    
    public void setSubject(Subject subject) {
        this.subject = subject;
    }
    
    @Override
    public String toString() {
        return "Result [id=" + id + ", studentId=" + studentId + ", subjectId=" + subjectId + 
               ", marks=" + marks + ", academicYear=" + academicYear + "]";
    }
}
