<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp">
    <jsp:param name="title" value="About Us" />
    <jsp:param name="active" value="about" />
</jsp:include>

<!-- About Section -->
<section class="about-section">
    <div class="container">
        <h2 class="section-title">About Modern Institute of Technology, Pune</h2>
        
        <div class="about-content">
            <div class="about-image">
                <img src="${pageContext.request.contextPath}/assets/images/campus.jpg" alt="MIT Pune Campus" class="campus-image">
            </div>
            
            <div class="about-text">
                <h3>Our Vision</h3>
                <p>To be a premier educational institution that nurtures talent, fosters innovation, and produces leaders who contribute to the betterment of society.</p>
                
                <h3>Our Mission</h3>
                <p>To provide quality education that combines theoretical knowledge with practical skills, enabling students to excel in their chosen fields and adapt to the evolving demands of the global marketplace.</p>
                
                <h3>Our History</h3>
                <p>Founded in 1995, Modern Institute of Technology, Pune has grown from a small engineering college to a comprehensive educational institution offering a wide range of programs in engineering, management, and computer applications.</p>
                
                <h3>Academic Excellence</h3>
                <p>We are committed to academic excellence and maintain high standards in teaching, research, and innovation. Our faculty members are experts in their respective fields and are dedicated to providing the best education to our students.</p>
                
                <h3>Infrastructure</h3>
                <p>Our campus is equipped with state-of-the-art facilities including modern classrooms, well-equipped laboratories, a comprehensive library, sports facilities, and a comfortable hostel for outstation students.</p>
            </div>
        </div>
        
        <div class="about-stats">
            <div class="stat-item">
                <div class="stat-value">25+</div>
                <div class="stat-label">Years of Excellence</div>
            </div>
            <div class="stat-item">
                <div class="stat-value">100+</div>
                <div class="stat-label">Experienced Faculty</div>
            </div>
            <div class="stat-item">
                <div class="stat-value">5000+</div>
                <div class="stat-label">Alumni Network</div>
            </div>
            <div class="stat-item">
                <div class="stat-value">50+</div>
                <div class="stat-label">Industry Partners</div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
