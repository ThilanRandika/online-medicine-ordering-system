<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Customer Account</title>
	<link rel="stylesheet" type="text/css" href="navigationBarcss.css">
	<style type="text/css">
		<style type="text/css">
    body {
        font-family: 'Hind SemiBold', sans-serif;
        background-color: #E1F5E6; /* Light green background */
        margin: 0;
        padding: 0;
    }

    table {
        border-collapse: collapse;
        width: 50%;
        margin: 20px auto;
        text-align: left;
    }

    th, td {
        border: 1px solid #4CAF50; /* Green border */
        padding: 10px;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #DFF0D8; /* Light green background for even rows */
    }
    
    .button-container {
	    text-align: center;
	    margin-top: 20px; /* Optional: Add some top margin to separate buttons from other content. Adjust as needed. */
	}
    

	</style>
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







	
	<table>
	<c:forEach var="cus" items="${customerData}">
	
	<c:set var="id" value="${cus.id}"/>
	<c:set var="name" value="${cus.name}"/>
	<c:set var="email" value="${cus.email}"/>
	<c:set var="phone" value="${cus.phone}"/>
	<c:set var="username" value="${cus.userName}"/>
	<c:set var="password" value="${cus.password}"/>
	<c:set var="address" value="${cus.address}"/>
	
	<tr>
		<td>Customer ID</td>
		<td>${customerData[0].id}</td>
	</tr>

	<tr>
		<td>Customer Email</td>
		<td>${customerData[0].email}</td>
	</tr>
	<tr>
		<td>Customer Phone</td>
		<td>${customerData[0].phone}</td>
	</tr>
	<tr>
		<td>Address</td>
		<td>${customerData[0].address}</td>
	</tr>
	<tr>
		<td>Customer User Name</td>
		<td>${customerData[0].userName}</td>
	</tr>
	<tr>
		<td>Customer password</td>
		<td>${customerData[0].password}</td>
	</tr>

	</c:forEach>
	</table>
	
	
	
	
	
	<c:url value="updatecustomer.jsp" var="cusupdate">
		<c:param name="cusid" value="${id}"/>
		<c:param name="name" value="${name}"/>
		<c:param name="email" value="${email}"/>
		<c:param name="phone" value="${phone}"/>
		<c:param name="uname" value="${username}"/>
		<c:param name="pass" value="${password}"/>
		<c:param name="address" value="${address}"/>
	</c:url>
	
	<div class="button-container">
	    <a href="${cusupdate}">
	        <input type="button" name="update" value="Update My Data">
	    </a>
	</div>

	
	<br>
	<c:url value="deletecustomer.jsp" var="cusdelete">
		<c:param name="id" value="${id}" />
		<c:param name="name" value="${name}" />
		<c:param name="email" value="${email}" />
		<c:param name="uname" value="${username}" />
		<c:param name="pass" value="${password}" />
		<c:param name="address" value="${address}"/>
	</c:url>
	
	<div class="button-container">
	    <a href="${cusdelete}">
	        <input type="button" name="delete" value="Delete My Account">
	    </a>
</div>

	
</body>
</html>