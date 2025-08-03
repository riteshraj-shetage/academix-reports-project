# 🎓 Academix – Student Result Management System

Academix is a web-based application built using Jakarta EE technologies (Servlets, JSP, JDBC) to streamline student exam result management. It provides secure, role-based access for administrators, teachers, and students, replacing manual workflows with a centralized, efficient system.

## 🚀 Features

- **User Authentication**
  - Secure login for Admin, Teacher, and Student roles
  - Session management and access control

- **Role-Based Dashboards**
  - Admin: Manage users, subjects, and view reports
  - Teacher: Enter and update student marks
  - Student: View personal results and performance summaries

- **Result Management**
  - Validated mark entry with real-time feedback
  - Instant result retrieval and performance summaries

- **Reporting & Analytics**
  - Pass/fail counts, average scores, grade distribution
  - Exportable report cards (future enhancement)

- **Database Integration**
  - MySQL backend with JDBC
  - Referential integrity via foreign keys

- **Secure & Scalable Architecture**
  - MVC pattern using Servlets (Controller), JSP (View), and DAOs (Model)
  - Session timeout and global error handling

## 🛠️ Tech Stack

| Layer       | Technology                          |
|-------------|-------------------------------------|
| Frontend    | HTML5, CSS3, JavaScript             |
| Backend     | Java SE 21, Jakarta Servlets & JSP  |
| Database    | MySQL 8.0.41                        |
| Server      | Apache Tomcat 11                    |
| Tools       | Eclipse / IntelliJ / NetBeans       |

## 📦 Requirements

- **Java JDK 8+**
- **Apache Tomcat 9+**
- **MySQL / MariaDB**
- **MySQL Connector/J**
- **Modern Browser (Chrome, Firefox, Edge)**

## 📌 Setup Instructions

1. Clone the repository
2. Import into your IDE (Eclipse/IntelliJ)
3. Configure MySQL database and update JDBC credentials
4. Deploy on Apache Tomcat
5. Access via `http://localhost:8080/Academix`
