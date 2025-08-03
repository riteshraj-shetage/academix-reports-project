-- Academix Database Schema

-- Drop database if exists and create a new one
DROP DATABASE IF EXISTS academix;
CREATE DATABASE academix;
USE academix;

-- Create Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    role ENUM('admin', 'faculty', 'student') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL
);

-- Create Admin table
CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create Faculty table
CREATE TABLE faculty (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    department VARCHAR(100),
    designation VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create Student table
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    roll_number VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    batch VARCHAR(20),
    program VARCHAR(100),
    semester INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create Subjects table
CREATE TABLE subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subject_code VARCHAR(20) NOT NULL UNIQUE,
    subject_name VARCHAR(100) NOT NULL,
    semester INT,
    program VARCHAR(100),
    max_marks INT DEFAULT 100,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP
);

-- Create Faculty-Subject mapping table
CREATE TABLE faculty_subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_id INT NOT NULL,
    subject_id INT NOT NULL,
    academic_year VARCHAR(20),
    FOREIGN KEY (faculty_id) REFERENCES faculty(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
    UNIQUE KEY (faculty_id, subject_id, academic_year)
);

-- Create Results table
CREATE TABLE results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    marks DECIMAL(5,2),
    exam_date DATE,
    academic_year VARCHAR(20),
    remarks VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,
    updated_by INT,
    FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    UNIQUE KEY (student_id, subject_id, academic_year)
);

-- Create Activity Log table
CREATE TABLE activity_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    activity_type VARCHAR(50) NOT NULL,
    description TEXT,
    ip_address VARCHAR(45),
    user_agent VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Create Report Cards table
CREATE TABLE report_cards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    semester INT NOT NULL,
    academic_year VARCHAR(20) NOT NULL,
    total_marks DECIMAL(7,2),
    percentage DECIMAL(5,2),
    grade VARCHAR(2),
    status ENUM('draft', 'published') DEFAULT 'draft',
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    generated_by INT,
    pdf_path VARCHAR(255),
    FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
    FOREIGN KEY (generated_by) REFERENCES users(id) ON DELETE SET NULL,
    UNIQUE KEY (student_id, semester, academic_year)
);

-- Create Institute Settings table
CREATE TABLE institute_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    setting_key VARCHAR(50) NOT NULL UNIQUE,
    setting_value TEXT,
    description VARCHAR(255),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert default admin user
INSERT INTO users (username, password, role) VALUES ('admin', 'admin123', 'admin');
INSERT INTO admin (user_id, name, email, phone) 
VALUES (1, 'System Administrator', 'admin@mitpune.edu.in', '9876543210');

-- Insert institute settings
INSERT INTO institute_settings (setting_key, setting_value, description) VALUES
('institute_name', 'Modern Institute of Technology, Pune', 'Full name of the institute'),
('institute_short_name', 'mitpune', 'Short name/abbreviation of the institute'),
('institute_address', '123 Generic Street, Pune, Maharashtra, India - 411001', 'Full address of the institute'),
('institute_phone', '+91 1234567890', 'Primary contact number'),
('institute_email', 'info@mitpune.edu.in', 'Primary contact email'),
('institute_website', 'www.mitpune.edu.in', 'Institute website URL'),
('logo_path', '/assets/images/logo.png', 'Path to the institute logo');

-- Insert sample subjects
INSERT INTO subjects (subject_code, subject_name, semester, program, max_marks) VALUES
('CS101', 'Introduction to Programming', 1, 'B.Tech Computer Science', 100),
('CS102', 'Computer Organization', 1, 'B.Tech Computer Science', 100),
('CS201', 'Data Structures', 2, 'B.Tech Computer Science', 100),
('CS202', 'Discrete Mathematics', 2, 'B.Tech Computer Science', 100),
('CS301', 'Database Management Systems', 3, 'B.Tech Computer Science', 100),
('CS302', 'Web Development', 3, 'B.Tech Computer Science', 100),
('CS303', 'Data Structures and Algorithms', 3, 'B.Tech Computer Science', 100),
('CS304', 'Operating Systems', 3, 'B.Tech Computer Science', 100),
('CS305', 'Computer Networks', 3, 'B.Tech Computer Science', 100);

-- Create sample faculty users
INSERT INTO users (username, password, role) VALUES 
('robert.smith', 'faculty123', 'faculty'),
('emily.johnson', 'faculty123', 'faculty');

-- Create sample faculty records
INSERT INTO faculty (user_id, name, email, phone, department, designation) VALUES
(2, 'Dr. Robert Smith', 'robert.smith@example.com', '9876543211', 'Computer Science', 'Professor'),
(3, 'Dr. Emily Johnson', 'emily.johnson@example.com', '9876543212', 'Computer Science', 'Associate Professor');

-- Create sample student users
INSERT INTO users (username, password, role) VALUES 
('john.doe', 'student123', 'student'),
('jane.smith', 'student123', 'student');

-- Create sample student records
INSERT INTO student (user_id, name, roll_number, email, phone, batch, program, semester) VALUES
(4, 'John Doe', 'CS-2025-001', 'john.doe@example.com', '9876543213', '2020-2024', 'B.Tech Computer Science', 3),
(5, 'Jane Smith', 'CS-2025-002', 'jane.smith@example.com', '9876543214', '2020-2024', 'B.Tech Computer Science', 3);

-- Assign subjects to faculty
INSERT INTO faculty_subjects (faculty_id, subject_id, academic_year) VALUES
(1, 5, '2025-2024'), -- Dr. Robert Smith - Database Management Systems
(1, 6, '2025-2024'), -- Dr. Robert Smith - Web Development
(2, 7, '2025-2024'), -- Dr. Emily Johnson - Data Structures and Algorithms
(2, 8, '2025-2024'), -- Dr. Emily Johnson - Operating Systems
(2, 9, '2025-2024'); -- Dr. Emily Johnson - Computer Networks

-- Insert sample results
INSERT INTO results (student_id, subject_id, marks, exam_date, academic_year, remarks, created_by) VALUES
(1, 5, 85, '2025-05-10', '2025-2024', 'Good performance', 2), -- John Doe - Database Management Systems
(1, 6, 92, '2025-05-12', '2025-2024', 'Excellent work', 2), -- John Doe - Web Development
(1, 7, 78, '2025-05-15', '2025-2024', 'Can improve', 3), -- John Doe - Data Structures and Algorithms
(1, 8, 88, '2025-05-18', '2025-2024', 'Very good', 3), -- John Doe - Operating Systems
(2, 5, 90, '2025-05-10', '2025-2024', 'Excellent understanding', 2), -- Jane Smith - Database Management Systems
(2, 6, 85, '2025-05-12', '2025-2024', 'Good work', 2), -- Jane Smith - Web Development
(2, 7, 82, '2025-05-15', '2025-2024', 'Good grasp of concepts', 3), -- Jane Smith - Data Structures and Algorithms
(2, 8, 88, '2025-05-18', '2025-2024', 'Very good', 3); -- Jane Smith - Operating Systems
