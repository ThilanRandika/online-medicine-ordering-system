<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "com.product.DBconnect" %>
<%@page import = "com.product.productDB" %>
<%@page import = "java.util.*" %>
<%@page import = "com.product.Product" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Home Guest</title>
    <link rel="stylesheet" type="text/css" href="navigationBarcss.css">
    <link rel="stylesheet" type="text/css" href="index.css">
    <link rel="stylesheet" type="text/css" href="homePage.css">
</head>
<body>



<header>
        <nav class="navbar">
            <div class="logo">

                <a href="#"><img src="system_images\logo.png" alt="Logo"></a>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="allProduct.jsp">Products</a></li>
                <li>

                    <form class="search-bar" id="search-form" action="SearchProductServlet" method="post">
				        <input type="text" id="search-input" name="searchTerm" placeholder="Search">
				        <button type="submit" id="search-button">Search</button>
				    </form>
                </li>
                
                <li id="prescription-tab"><a href="login.jsp"><i class="fas fa-file-medical"></i> Add Prescription</a></li>
                <li id="view-prescription-tab"><a href="login.jsp"><i class="fas fa-file-alt"></i> View Prescription</a></li>
                <li><a href="login.jsp">Log In</a></li>
            </ul>
        </nav>
    </header>



	<div class="first-section">
    <div class="background-image">
        <img src="system_images/first_section.png" alt="" >
    </div>
    <div class="order-products">
        <h1>Order Your Products</h1>
        <p>Find and order the medicines you need</p>
        <a href="login.jsp"><button>Order Now</button></a>
    </div>
</div>


    <!-- Second Section -->
    <div class="second-section">
    <div class="upload-prescription">
        <h1>Upload Prescription</h1>
        <p>For a fast and easy purchase experience</p>
        <a href="login.jsp"><button>Upload Now</button></a>
    </div>
    <div class="prescription-image">
        <img src="system_images/a-man-working-on-the-computer-vector-illustration-2AK2KAD.jpg" alt="" width="100%" height="300">
    </div>
    
</div>


    <!-- Third Section -->
  <div class="third-section">
    <div class="green-line"></div>
    <div class="restoration-services">
        <h1>Get the Restoration Services You Need?</h1>
        <p>Find high-quality restoration services in one place.</p>
        <button>Get a Fast Quote</button>
    </div>
</div>


    <!-- Fourth Section - Product Cards -->
<%
	List<Product> product = new ArrayList<Product>();
	product = productDB.getFirstFourProducts();
%>
    
<div class="fourth-section">
    <h1>Products</h1>
    <div class="card-container">
        <% if (!product.isEmpty()) {
            for (Product p : product) {
                %>
                <div class="card">
                    <img src="<%= request.getContextPath() %>/productImage/<%= p.getProductImage()%>" alt="">
                    <div class="product-detail">
                        <span><%= p.getProductName() %></span>
                        <p><%= p.getProductDescription() %></p>
                        <div class="buttons">
                            <div class="price">Rs.<%= p.getProductPrice() %></div>
                            <a href="UserProductViewServlet?PId=<%= p.getProductId() %>">
                                <button class="cart btn">View</button>
                            </a>
                        </div>
                    </div>
                </div>
                <% }
                %>
        <% }
        %>
    </div>
    <div class="view-more-container">
        <a href="allProduct.jsp"> <!-- Replace this link with the link for viewing all products -->
            <button class="view-more-btn">View More</button>
        </a>
    </div>
</div>



<!-- Fifth Section - Customer Reviews -->
<div class="fifth-section">
    <div class="customer-review">
        <div class="customer-avatar">
            <img src="system_images/cus1.png" alt="">
        </div>
        <div class="customer-info">
            <h3>Customer Name</h3>
            <p>Review content goes here. It can be a longer text describing the experience or feedback.</p>
        </div>
    </div>

    <!-- Another customer review -->
    <div class="customer-review">
        <div class="customer-avatar">
            <img src="system_images/cus2.png" alt="">
        </div>
        <div class="customer-info">
            <h3>Another Customer</h3>
            <p>Another review content goes here.lorem khkgj kjhoegh hh hwouiggh uhwropuirg hwhg uhwig </p>
        </div>
    </div>
    <!-- Repeat for other customer reviews -->
    <div class="customer-review">
        <div class="customer-avatar">
            <img src="system_images/cus3.png" alt="">
        </div>
        <div class="customer-info">
            <h3>Another Customer</h3>
            <p>Another review content goes here. ighwieuf iugwiue f iugiuwe iughw iughiw iuhwef iughf iughw</p>
        </div>
    </div>
    
</div>

<!-- Sixth Section - Find Us Form --

<!-- Seventh Section - Contact Us Form -->
<!-- Seventh Section - Contact Us -->
<div class="seventh-section">
    <h2>Contact Us</h2>
    <form class="contact-form">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Your name" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Your email" required>
        </div>
        <div class="form-group">
            <label for="message">Message</label>
            <textarea id="message" name="message" placeholder="Your message" required></textarea>
        </div>
        <button type="submit">Submit</button>
    </form>
</div>


<!-- Eighth Section - Our Services Icons -->
<div class="eighth-section">
    <div class="our-services">    
    	<h2>Our Services</h2>
	        <div class="service-icon">
	            <i class="fas fa-shipping-fast"></i><!-- Your service icon structure goes here -->
	        </div>
	        <div class="service-icon">
				<i class="fas fa-lock"></i><!-- Another service icon structure goes here -->
	        </div>
	        <div class="service-icon">
				<i class="fas fa-boxes"></i><!-- Another service icon structure goes here -->
	        </div>
	        <div class="service-icon">
				<i class="fas fa-headset"></i><!-- Another service icon structure goes here -->
	        </div>
    </div>
</div>


	
	
<script>

        var loggedIn = true; // Change this to true when the user is logged in

        if (loggedIn) {
            document.getElementById("cart-tab").style.display = "block";
            document.getElementById("profile-tab").style.display = "block";
            document.getElementById("prescription-tab").style.display = "block";
            document.getElementById("view-prescription-tab").style.display = "block";
            document.getElementById("logout-tab").style.display = "block";
        } else {
            document.getElementById("cart-tab").style.display = "none";
            document.getElementById("profile-tab").style.display = "none";
            document.getElementById("prescription-tab").style.display = "none";
            document.getElementById("view-prescription-tab").style.display = "none";

            document.getElementById("logout-tab").style.display = "none";
        }
    </script>



<%@include file="footer.jsp" %>

<footer>
    <div class="footer-content">
        <p>&copy; 2023 Medicine Ordering System</p>
    </div>
</footer>

</body>
</html>