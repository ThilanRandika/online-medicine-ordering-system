<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Registered customer</title>
<link rel="stylesheet" type="text/css" href="HomeRegisteredCus.css">
<link rel="stylesheet" type="text/css" href="navigationBarcss.css">
</head>
<body>

	
	
	<c:forEach var="customer" items="${customerData}">
		
		<c:set var="id" value="${customer.id}" />
		<c:set var="name" value="${customer.name}" />
		<c:set var="email" value="${customer.email}" />
		<c:set var="phone" value="${customer.phone}" />
		<c:set var="userName" value="${customer.userName}" />
		<c:set var="password" value="${customer.password}" />
		<c:set var="address" value="${customer.address}" />
	
	</c:forEach>
	
	
	<c:url value="prescriptionUpload.jsp" var="presUpload">
		<c:param name="id" value="${id}"/>
		<c:param name="name" value="${name}"/>
		<c:param name="email" value="${email}"/>
		<c:param name="phone" value="${phone}"/>
		<c:param name="uname" value="${username}"/>
	</c:url>
	
	<c:url value="prescriptionStatus.jsp" var="presStatus">
		<c:param name="id" value="${id}"/>
		<c:param name="name" value="${name}"/>
		<c:param name="email" value="${email}"/>
		<c:param name="phone" value="${phone}"/>
		<c:param name="uname" value="${username}"/>
	</c:url>
	
	
	
	
	
	
	<header>
        <nav class="navbar">
            <div class="logo">
                <a href="#"><img src="logo.png" alt="Logo"></a>
            </div>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>
                <li><a href="AdminproductListPage.jsp">Products</a></li>
                <a href="${presStatus}">
					<li>Prescriptions</li>
				</a>
                
                <li>
                    <div class="search-bar">
                        <input type="text" placeholder="Search">
                        <button type="submit">Search</button>
                    </div>
                </li>
                <a href="${presUpload}">
                	<li>Upload Prescription</li>
                </a>
                <li id="cart-tab"><a href="#">Cart</a></li>
                
                <li id="profilebtn">
                <form action="userAcc" method="post">
					<input type="hidden" name="cusid" value="${id}" >
					<input type="hidden" name="name" value="<${name}">
					<input type="hidden" name="email" value="${email}">
					<input type="hidden" name="phone" value="${phone}">
					<input type="hidden" name="uname" value="${userName}">
					<input type="hidden" name="pass" value="${password}">
					<input type="hidden" name="address" value="${address}">
				<input type="submit" name="account" value="Profile">
				</form>
                </li>
                
                <li id="logout-tab"><a href="#">Logout</a></li>
            </ul>
        </nav>
    </header>
	
	
	<main class="content">
        <section class="welcome-section">
            <h1>Welcome to our Medicine Ordering System</h1>
            <p>Your trusted source for ordering medicines online.</p>
        </section>
        
        <section class="featured-products">
            <h2>Featured Products</h2>
            
        </section>
    </main>
    
    <%@include file="footer.jsp" %>
    <footer>
        <div class="footer-content">
            <p>&copy; 2023 Medicine Ordering System</p>
        </div>
    </footer>
	
	

	
	
	

</body>
</html>