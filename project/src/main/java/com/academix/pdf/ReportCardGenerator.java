package com.academix.pdf;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import com.academix.model.Student;
import com.academix.model.Result;

/**
 * Utility class for generating PDF report cards
 */
public class ReportCardGenerator {
    
    /**
     * Generate a PDF report card for a student
     * @param student the Student object
     * @param results list of Result objects
     * @param logoPath path to the institute logo for watermarking
     * @return byte array containing the PDF data
     * @throws DocumentException if a document error occurs
     * @throws IOException if an I/O error occurs
     */
    public static byte[] generateReportCard(Student student, List<Result> results, String logoPath) 
            throws DocumentException, IOException {
        
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        Document document = new Document();
        PdfWriter writer = PdfWriter.getInstance(document, baos);
        
        // Add watermark
        writer.setPageEvent(new WatermarkPageEvent(logoPath));
        
        document.open();
        
        // Add institute header
        Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
        Paragraph header = new Paragraph("Modern Institute of Technology, Pune", headerFont);
        header.setAlignment(Element.ALIGN_CENTER);
        document.add(header);
        
        Paragraph address = new Paragraph("123 Generic Street, Pune, Maharashtra, India");
        address.setAlignment(Element.ALIGN_CENTER);
        document.add(address);
        
        Paragraph contact = new Paragraph("Email: info@mitpune.edu.in | Phone: +91 1234567890");
        contact.setAlignment(Element.ALIGN_CENTER);
        document.add(contact);
        
        document.add(new Paragraph(" ")); // Add space
        
        // Add report card title
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14);
        Paragraph title = new Paragraph("STUDENT REPORT CARD", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);
        
        document.add(new Paragraph(" ")); // Add space
        
        // Add student details
        PdfPTable studentTable = new PdfPTable(2);
        studentTable.setWidthPercentage(100);
        
        addTableCell(studentTable, "Name:", student.getName());
        addTableCell(studentTable, "Roll Number:", student.getRollNumber());
        addTableCell(studentTable, "Program:", student.getProgram());
        addTableCell(studentTable, "Semester:", String.valueOf(student.getSemester()));
        addTableCell(studentTable, "Batch:", student.getBatch());
        
        document.add(studentTable);
        
        document.add(new Paragraph(" ")); // Add space
        
        // Add results table
        PdfPTable resultsTable = new PdfPTable(4);
        resultsTable.setWidthPercentage(100);
        
        // Add table header
        Font tableHeaderFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
        PdfPCell cell = new PdfPCell(new Phrase("Subject Code", tableHeaderFont));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(new com.itextpdf.text.BaseColor(240, 240, 240));
        resultsTable.addCell(cell);
        
        cell = new PdfPCell(new Phrase("Subject Name", tableHeaderFont));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(new com.itextpdf.text.BaseColor(240, 240, 240));
        resultsTable.addCell(cell);
        
        cell = new PdfPCell(new Phrase("Max Marks", tableHeaderFont));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(new com.itextpdf.text.BaseColor(240, 240, 240));
        resultsTable.addCell(cell);
        
        cell = new PdfPCell(new Phrase("Marks Obtained", tableHeaderFont));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(new com.itextpdf.text.BaseColor(240, 240, 240));
        resultsTable.addCell(cell);
        
        // Add result rows
        double totalMarks = 0;
        double totalMaxMarks = 0;
        
        for (Result result : results) {
            resultsTable.addCell(result.getSubject().getSubjectCode());
            resultsTable.addCell(result.getSubject().getSubjectName());
            
            cell = new PdfPCell(new Phrase(String.valueOf(result.getSubject().getMaxMarks())));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            resultsTable.addCell(cell);
            
            cell = new PdfPCell(new Phrase(String.valueOf(result.getMarks())));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            resultsTable.addCell(cell);
            
            totalMarks += result.getMarks();
            totalMaxMarks += result.getSubject().getMaxMarks();
        }
        
        document.add(resultsTable);
        
        document.add(new Paragraph(" ")); // Add space
        
        // Add summary
        PdfPTable summaryTable = new PdfPTable(2);
        summaryTable.setWidthPercentage(50);
        summaryTable.setHorizontalAlignment(Element.ALIGN_RIGHT);
        
        Font summaryFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
        
        cell = new PdfPCell(new Phrase("Total Marks:", summaryFont));
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setBorder(Rectangle.NO_BORDER);
        summaryTable.addCell(cell);
        
        cell = new PdfPCell(new Phrase(totalMarks + " / " + totalMaxMarks));
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setBorder(Rectangle.NO_BORDER);
        summaryTable.addCell(cell);
        
        double percentage = (totalMarks / totalMaxMarks) * 100;
        
        cell = new PdfPCell(new Phrase("Percentage:", summaryFont));
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setBorder(Rectangle.NO_BORDER);
        summaryTable.addCell(cell);
        
        cell = new PdfPCell(new Phrase(String.format("%.2f%%", percentage)));
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setBorder(Rectangle.NO_BORDER);
        summaryTable.addCell(cell);
        
        document.add(summaryTable);
        
        document.add(new Paragraph(" ")); // Add space
        document.add(new Paragraph(" ")); // Add space
        
        // Add signature section
        PdfPTable signatureTable = new PdfPTable(2);
        signatureTable.setWidthPercentage(100);
        
        cell = new PdfPCell(new Phrase("Faculty Signature"));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(50);
        signatureTable.addCell(cell);
        
        cell = new PdfPCell(new Phrase("Principal Signature"));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(50);
        signatureTable.addCell(cell);
        
        document.add(signatureTable);
        
        // Add footer
        Paragraph footer = new Paragraph("This is a computer-generated report card and does not require a physical signature.");
        footer.setAlignment(Element.ALIGN_CENTER);
        document.add(footer);
        
        document.close();
        
        return baos.toByteArray();
    }
    
    /**
     * Helper method to add a row to the student details table
     * @param table the PdfPTable to add to
     * @param label the label text
     * @param value the value text
     */
    private static void addTableCell(PdfPTable table, String label, String value) {
        Font labelFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
        PdfPCell cell = new PdfPCell(new Phrase(label, labelFont));
        cell.setBorder(Rectangle.NO_BORDER);
        table.addCell(cell);
        
        cell = new PdfPCell(new Phrase(value));
        cell.setBorder(Rectangle.NO_BORDER);
        table.addCell(cell);
    }
    
    /**
     * Inner class for adding watermark to each page
     */
    static class WatermarkPageEvent extends com.itextpdf.text.pdf.PdfPageEventHelper {
        private String logoPath;
        
        public WatermarkPageEvent(String logoPath) {
            this.logoPath = logoPath;
        }
        
        @Override
        public void onEndPage(PdfWriter writer, Document document) {
            try {
                // Add watermark
                Image watermark = Image.getInstance(logoPath);
                watermark.setAbsolutePosition(
                    (document.getPageSize().getWidth() - watermark.getScaledWidth()) / 2,
                    (document.getPageSize().getHeight() - watermark.getScaledHeight()) / 2);
                watermark.setTransparency(new int[] { 75, 75 });
                writer.getDirectContentUnder().addImage(watermark);
                
                // Add footer
                PdfPTable footer = new PdfPTable(1);
                footer.setWidthPercentage(100);
                footer.setTotalWidth(document.getPageSize().getWidth() - document.leftMargin() - document.rightMargin());
                
                PdfPCell cell = new PdfPCell(new Phrase("mitpune - " + 
                    "Modern Institute of Technology, Pune"));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setBorder(Rectangle.NO_BORDER);
                footer.addCell(cell);
                
                footer.writeSelectedRows(0, -1, document.leftMargin(),
                    document.bottomMargin() - 10, writer.getDirectContent());
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
