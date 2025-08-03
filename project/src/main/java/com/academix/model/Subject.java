package com.academix.model;

/**
 * Model class representing a subject in the system
 */
public class Subject {
    private int id;
    private String subjectCode;
    private String subjectName;
    private int semester;
    private String program;
    private int maxMarks;
    
    // Default constructor
    public Subject() {
    }
    
    // Parameterized constructor
    public Subject(int id, String subjectCode, String subjectName, int semester, String program, int maxMarks) {
        this.id = id;
        this.subjectCode = subjectCode;
        this.subjectName = subjectName;
        this.semester = semester;
        this.program = program;
        this.maxMarks = maxMarks;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getSubjectCode() {
        return subjectCode;
    }
    
    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }
    
    public String getSubjectName() {
        return subjectName;
    }
    
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
    
    public int getSemester() {
        return semester;
    }
    
    public void setSemester(int semester) {
        this.semester = semester;
    }
    
    public String getProgram() {
        return program;
    }
    
    public void setProgram(String program) {
        this.program = program;
    }
    
    public int getMaxMarks() {
        return maxMarks;
    }
    
    public void setMaxMarks(int maxMarks) {
        this.maxMarks = maxMarks;
    }
    
    @Override
    public String toString() {
        return "Subject [id=" + id + ", subjectCode=" + subjectCode + ", subjectName=" + subjectName + 
               ", semester=" + semester + ", program=" + program + ", maxMarks=" + maxMarks + "]";
    }
}
