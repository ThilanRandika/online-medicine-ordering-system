<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List" %>
<%@ page import="com.prescription.Prescription" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Prescription Request Details</title>
    <link rel="stylesheet" type="text/css" href="PrescriptionRequestDetails.css">
</head>
<body>
	<nav class="sidenav">
        <ul>
            <li><a href="HOME_staff.jsp">Home</a></li>
            <li><a href="PrescriptionRequests.jsp">Prescription Requests</a></li>
        </ul>
    </nav>
    <div class="container">
        <h1>Prescription Request Details</h1>
        <div class="request-details">
            <c:forEach items="${presriptionDetails}" var="prescription">
                <div class="details-container">
                    <div class="left-details">
                        <h2>Prescription Request <c:out value="${prescription.getId()}" /></h2>
                        <p><strong>Request ID:</strong> <c:out value="${prescription.getId()}" /></p>
                        <p><strong>Date:</strong> <fmt:formatDate value="${prescription.getDate()}" pattern="MMMM dd, yyyy" /></p>
                        <p><strong>Status:</strong> <c:out value="${prescription.getStatus()}" /></p>
                        <p><strong>Patient's Age:</strong> <c:out value="${prescription.getPatientAge()}" /></p>
                        <p><strong>Contact Number:</strong> <c:out value="${prescription.getContactNumber()}" /></p>
                        <p><strong>Order Type:</strong> <c:out value="${prescription.getOrderType()}" /></p>
                        <p><strong>Fulfillment:</strong> <c:out value="${prescription.getFulfillment()}" /></p>
                        <p><strong>Receiving Substitutes:</strong> <c:out value="${prescription.getSubstitutes()}" /></p>
                        <p><strong>Customer ID:</strong> <c:out value="${prescription.getCusID()}" /></p>
                        <p><strong>Patient Name:</strong> <c:out value="${prescription.getPatientName()}" /></p>
                        <p><strong>Email:</strong> <c:out value="${prescription.getEmail()}" /></p>
                    </div>
                    
                    <div class="right-details">
                        <p><strong>Prescription :</strong> <c:out value="${prescription.getImageName()}" /></p>
                        <img src="images/<c:out value="${prescription.getImageName()}" />" alt="Prescription Image" />
                    </div>
                </div>
                <div class="actions">
                    <form action="presAction" method="get">
                        <input type="hidden" name="presID" value="<c:out value='${prescription.getId()}' />" />
                        <input type="submit" name="action" value="Approve" class="btn" />
                    </form>
                    <form action="presAction" method="get">
                        <input type="hidden" name="presID" value="<c:out value='${prescription.getId()}' />" />
                        <input type="submit" name="action" value="Reject" class="btn" />
                    </form>
                </div>
            </c:forEach>
            <br>
            <a href="PrescriptionRequests.jsp">Back to Requests</a>
        </div>
    </div>
</body>
</html>
