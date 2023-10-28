<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.prescription.Prescription" %>
<jsp:useBean id="prescriptionDBUtil" class="com.prescription.PrescriptionDBUtil" />
<%
    List<Prescription> requests = prescriptionDBUtil.getPrescriptionRequests();
%>
<html>
<head>
    <title>Prescription Requests</title>
    <link rel="stylesheet" type="text/css" href="prescriptionRequests.css">
</head>
<body>
	
	
	<div class="sidebar">
        <a href="HOME_staff.jsp">Home</a>
        <a href="PrescriptionRequests.jsp">Prescription Requests</a>
    </div>

    <div class="container">
        <h1>Prescription Requests</h1>
        <ul class="request-list">
            <% for (Prescription req : requests) { %>
                <li>
                    <div class="request-card">
                        <p><strong>Request ID:</strong> <%= Integer.toString(req.getId()) %></p>
                        <p><strong>Date:</strong> <%= req.getDate() %></p>
                        <p><strong>Order Type:</strong> <%= req.getOrderType() %></p>
                        <p><strong>Status:</strong> <%= req.getStatus() %></p>
                        
                        <form action="presDetails" method="get">
                        	<input type="hidden" name="presID" value="<%= req.getId() %>" />
                        	<input type="submit" value="View Details" class="btn" />
                        </form>
                    </div>
                </li>
            <% } %>
        </ul>
    </div>
    
    
    
</body>
</html>
