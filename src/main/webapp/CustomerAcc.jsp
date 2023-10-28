<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Customer Account</title>
	<style type="text/css">
		body{
			font-family: Hind SemiBold;
		}
	
		table, th, td {
  			border: 1px solid black;
		}
	</style>
</head>
<body>
	
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
	
	
	<form action="UpdateCustomerServlet" method="post">
	    <input type="hidden" name="cusid" value="${cus.id}">
	    <input type="hidden" name="name" value="${cus.name}">
	    <input type="hidden" name="email" value="${cus.email}">
	    <input type="hidden" name="phone" value="${cus.phone}">
	    <input type="hidden" name="uname" value="${cus.userName}">
	    <input type="hidden" name="pass" value="${cus.password}">
	    <input type="hidden" name="address" value="${cus.address}">
	    <input type="submit" name="update" value="Update My Data">
	</form>
	
	
	
	<c:url value="updatecustomer.jsp" var="cusupdate">
		<c:param name="id" value="${id}"/>
		<c:param name="name" value="${name}"/>
		<c:param name="email" value="${email}"/>
		<c:param name="phone" value="${phone}"/>
		<c:param name="uname" value="${username}"/>
		<c:param name="pass" value="${password}"/>
		<c:param name="address" value="${address}"/>
	</c:url>
	
	<a href="${cusupdate}">
	<input type="button" name="update" value="Update My Data">
	</a>
	
	<br>
	<c:url value="deletecustomer.jsp" var="cusdelete">
		<c:param name="id" value="${id}" />
		<c:param name="name" value="${name}" />
		<c:param name="email" value="${email}" />
		<c:param name="uname" value="${username}" />
		<c:param name="pass" value="${password}" />
		<c:param name="address" value="${address}"/>
	</c:url>
	<a href="${cusdelete}">
	<input type="button" name="delete" value="Delete My Account">
	</a>
	
</body>
</html>