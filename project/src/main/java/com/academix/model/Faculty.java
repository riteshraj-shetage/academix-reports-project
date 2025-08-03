package com.academix.model;

/**
 * Model class representing a faculty member in the system
 */
public class Faculty {
    private int id;
    private int userId;
    private String name;
    private String email;
    private String phone;
    private String department;
    private String designation;
    
    // Default constructor
    public Faculty() {
    }
    
    // Parameterized constructor
    public Faculty(int id, int userId, String name, String email, 
                  String phone, String department, String designation) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.department = department;
        this.designation = designation;
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
    
    public String getDepartment() {
        return department;
    }
    
    public void setDepartment(String department) {
        this.department = department;
    }
    
    public String getDesignation() {
        return designation;
    }
    
    public void setDesignation(String designation) {
        this.designation = designation;
    }
    
    @Override
    public String toString() {
        return "Faculty [id=" + id + ", userId=" + userId + ", name=" + name + 
               ", email=" + email + ", department=" + department + ", designation=" + designation + "]";
    }
}
