<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp">
    <jsp:param name="title" value="Contact Us" />
    <jsp:param name="active" value="contact" />
</jsp:include>

<!-- Contact Section -->
<section class="contact-section">
    <div class="container">
        <h2 class="section-title">Contact Us</h2>
        
        <div class="contact-content">
            <div class="contact-info">
                <div class="contact-card">
                    <div class="contact-icon">📍</div>
                    <h3>Address</h3>
                    <p>123 Generic Street, Pune, Maharashtra, India - 411001</p>
                </div>
                
                <div class="contact-card">
                    <div class="contact-icon">📞</div>
                    <h3>Phone</h3>
                    <p>Main Office: +91 1234567890</p>
                    <p>Admissions: +91 1234567891</p>
                    <p>Examinations: +91 1234567892</p>
                </div>
                
                <div class="contact-card">
                    <div class="contact-icon">✉️</div>
                    <h3>Email</h3>
                    <p>General Inquiries: info@mitpune.edu.in</p>
                    <p>Admissions: admissions@mitpune.edu.in</p>
                    <p>Examinations: exams@mitpune.edu.in</p>
                </div>
                
                <div class="contact-card">
                    <div class="contact-icon">🕒</div>
                    <h3>Office Hours</h3>
                    <p>Monday to Friday: 9:00 AM to 5:00 PM</p>
                    <p>Saturday: 9:00 AM to 1:00 PM</p>
                    <p>Sunday: Closed</p>
                </div>
            </div>
            
            <div class="contact-form-container">
                <h3>Send us a Message</h3>
                <form class="contact-form">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" id="subject" name="subject" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" rows="5" required></textarea>
                    </div>
                    
                    <button type="submit" class="submit-button">Send Message</button>
                </form>
            </div>
        </div>
        
        <div class="map-container">
            <h3>Find Us on Map</h3>
            <div class="map">
                <!-- Placeholder for map -->
                <img src="${pageContext.request.contextPath}/assets/images/map.jpg" alt="Map to MIT Pune" class="map-image">
            </div>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
