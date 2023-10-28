<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.prescription.Prescription" %>
<jsp:useBean id="prescriptionDBUtil" class="com.prescription.PrescriptionDBUtil" />


<%
	String cusId = request.getParameter("id");
	String cusName = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String userName = request.getParameter("userName");
    List<Prescription> prescriptions = prescriptionDBUtil.getCustmerPrescriptions(cusId);
%>
<html>
<head>
    <title>Prescription Status</title>
    <link rel="stylesheet" type="text/css" href="prescriptionStatus.css">
    <link rel="stylesheet" type="text/css" href="navigationBarcss.css">
</head>
<body>

	<header>
        <nav class="navbar">
            <div class="logo">
                <a href="#"><img src="logo.png" alt="Logo"></a>
            </div>
            <ul class="nav-links">
                
                
                <li><a href="prescriptionUpload.jsp?id=<%= cusId %>&name=<%= cusName %>&email=<%= email %>&phone=<%= phone %>&uname=<%= userName %>">Upload Prescription</a></li>
             	
            </ul>
        </nav>
    </header>
	
    <h1>Prescription Status</h1>

    <div>
        <table>
            <tr>
                <th>RefNo</th>
                <th>Order Type</th>
                <th>Fulfillment</th>
                <th>Substitutes</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            
            <% for (Prescription pre : prescriptions) {%>
            <tr>
            	<td> <%= Integer.toString(pre.getId()) %> </td>
            	<td> <%= pre.getOrderType() %> </td>
            	<td> <%= pre.getFulfillment() %> </td>
            	<td> <%= pre.getSubstitutes() %> </td>
            	<td> <%= pre.getStatus() %> </td>
            	<td>
            		<form action="presDelete" method="get">
            			<input type="hidden" name="cusId" value="<%= cusId %>" />
				        <input type="hidden" name="presID" value="<%= Integer.toString(pre.getId()) %>" />
				        <input type="submit" name="action" value="Delete" class="btn" />
				    </form>
            	</td>
            </tr>
            <% } %>
            
                
        </table>
    </div>
</body>
</html>


