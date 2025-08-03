package com.academix.model;

/**
 * Model class representing a student in the system
 */
public class Student {
    private int id;
    private int userId;
    private String name;
    private String rollNumber;
    private String email;
    private String phone;
    private String batch;
    private String program;
    private int semester;
    
    // Default constructor
    public Student() {
    }
    
    // Parameterized constructor
    public Student(int id, int userId, String name, String rollNumber, String email, 
                  String phone, String batch, String program, int semester) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.rollNumber = rollNumber;
        this.email = email;
        this.phone = phone;
        this.batch = batch;
        this.program = program;
        this.semester = semester;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getRollNumber() {
        return rollNumber;
    }
    
    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getBatch() {
        return batch;
    }
    
    public void setBatch(String batch) {
        this.batch = batch;
    }
    
    public String getProgram() {
        return program;
    }
    
    public void setProgram(String program) {
        this.program = program;
    }
    
    public int getSemester() {
        return semester;
    }
    
    public void setSemester(int semester) {
        this.semester = semester;
    }
    
    @Override
    public String toString() {
        return "Student [id=" + id + ", userId=" + userId + ", name=" + name + ", rollNumber=" + rollNumber + 
               ", email=" + email + ", program=" + program + ", semester=" + semester + "]";
    }
}
