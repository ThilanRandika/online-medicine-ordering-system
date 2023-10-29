<%@page import = "com.product.DBconnect" %>
<%@page import = "com.product.productDB" %>
<%@page import = "java.util.*" %>
<%@page import = "com.product.Product" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="test1.css">
<link rel="stylesheet" href="test1.2.css">
<link rel="stylesheet" href="navigationBarcss.css">
<style>
    /* Add your CSS for the left-side menu here */
    .leftNav {
        float: left;
        width: 200px;
        background-color: #333;
        color: #fff;
        padding: 20px;
    }

    .leftNav ul {
        list-style: none;
        padding: 0;
    }

    .leftNav ul li {
        margin-bottom: 10px;
    }

    .leftNav ul li a {
        text-decoration: none;
        color: #fff;
        font-weight: bold;
        display: block;
    }

    .leftNav ul li a:hover {
        background-color: #555;
        padding: 5px;
        border-radius: 5px;
    }
</style>
</head>
<body>
<%
	List<Product> product = new ArrayList<Product>();
	product = productDB.getProductDetails();
%>

<%@include file="navigationBar.jsp" %>

    <div class="bigCont"> 
        <div class="mainContainer">
            <%
		if(!product.isEmpty()) {
			for(Product p : product) {%>
                <div class="container">
                    <div class="card">
                        <img src="<%= request.getContextPath() %>/productImage/<%= p.getProductImage()%>" alt="">
                        <div class="product-detail">
                            <span><%= p.getProductName() %></span>
                            <p><%= p.getProductDescription() %></p>
                            <div class="buttons">
                                <div class="price">Rs.<%= p.getProductPrice() %></div>
                                <a href="UserProductViewServlet?PId=<%= p.getProductId() %>">
                                <button class="cart btn">View Details</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
           <% }
			
		}
	%>
        </div>
    </div>
    
    <%@include file="footer.jsp" %>
</body>
</html>
