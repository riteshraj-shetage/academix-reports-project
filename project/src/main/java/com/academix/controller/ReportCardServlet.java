package com.academix.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.academix.dao.StudentDAO;
import com.academix.dao.ResultDAO;
import com.academix.model.Student;
import com.academix.model.Result;
import com.academix.pdf.ReportCardGenerator;

/**
 * Servlet for generating and downloading PDF report cards
 */
@WebServlet("/report-card")
public class ReportCardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private StudentDAO studentDAO;
    private ResultDAO resultDAO;
    
    public void init() {
        studentDAO = new StudentDAO();
        resultDAO = new ResultDAO();
    }
    
    /**
     * Handle GET requests - generate and download PDF report card
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }
        
        // Get student ID from request parameter
        String studentIdParam = request.getParameter("studentId");
        if (studentIdParam == null || studentIdParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Student ID is required");
            return;
        }
        
        try {
            int studentId = Integer.parseInt(studentIdParam);
            
            // Get student and results data
            Student student = studentDAO.getStudentById(studentId);
            if (student == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found");
                return;
            }
            
            List<Result> results = resultDAO.getResultsByStudentId(studentId);
            
            // Get logo path for watermarking
            String logoPath = getServletContext().getRealPath("/assets/images/logo.png");
            
            // Generate PDF
            byte[] pdfBytes = ReportCardGenerator.generateReportCard(student, results, logoPath);
            
            // Set response headers
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=report_card_" + student.getRollNumber() + ".pdf");
            response.setContentLength(pdfBytes.length);
            
            // Write PDF to response
            OutputStream os = response.getOutputStream();
            os.write(pdfBytes);
            os.flush();
            os.close();
            
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid student ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating report card");
        }
    }
}
