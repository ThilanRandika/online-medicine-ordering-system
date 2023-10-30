<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Staff Home</title>
    <link rel="stylesheet" type="text/css" href="staffHome.css">
    <link rel="stylesheet" type="text/css" href="navigationBarcss.css">
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <a href="#"><img src="logo.png" alt="Logo"></a>
            </div>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>	
                <li><a href="PrescriptionRequests.jsp">Prescription Requests</a></li>
            </ul>
        </nav>
    </header>
    
    <main class="content">
	    <section class="welcome-section">
	        <h1>Welcome, Staff</h1>
	        <p>This is the staff dashboard. You have access to various features and functionalities to manage the system.</p>
	    </section>
	
	    <section class="features-section">
	        <h2>Features for Staff</h2>
	        <ul>
	            <li><a href="PrescriptionRequests.jsp">Manage Prescription Requests</a></li>
	            
	        </ul>
	    </section>
	</main>
    
    <footer>
        <div class="footer-content">
            <p>&copy; 2023 Medicine Ordering System</p>
        </div>
    </footer>
    
</body>
</html>
