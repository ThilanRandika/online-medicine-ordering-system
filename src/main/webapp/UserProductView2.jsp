<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.product.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Details (Admin Edit)</title>
    <link rel="stylesheet" type="text/css" href="UserProductView.css">
    <link rel="stylesheet" type="text/css" href="footer.css">
    
    <style>
        /* Page Styles */
        .outer {
            background: linear-gradient(to bottom, #b7ffb9, #daffdb, #ffffff); /* Dark Green background color */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #fff;
            
        }

        /* Container Styles */
        .container {
            text-align: center;
            padding: 20px;
            background-color: #fff; /* White background color */
            border-radius: 10px;
            color: #4CAF50; /* Dark Green text color */
            width: 80%;
            max-width: 400px;
    		box-shadow: 5px 5px 20px 5px black;
        }

        /* Product Image Styles */
        .product-image img {
            max-width: 100%;
        }

        /* Product Info Styles */
        .product-info {
            padding: 20px;
        }

        .product-info p {
            font-size: 18px;
            margin: 10px 0;
        }

        /* Add to Cart Button Styles */
        .add-to-cart input[type="submit"] {
            background-color: #4CAF50; /* Dark Green button background color */
            color: #fff; /* White button text color */
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 18px;
        }

        .add-to-cart input[type="submit"]:hover {
            background-color: #45a049; /* Darker green on hover */
        }
    </style>
</head>
<body>
    <%@include file="navigationBar.jsp" %>
    <% Product p = (Product) request.getAttribute("product"); %>
    <div class="outer">
    <div class="container">
        <h1>Product Details</h1>
        <div class="product-image">
            <img src="<%= request.getContextPath() %>/productImage/<%= p.getProductImage() %>" alt="Product Image">
        </div>
        
        
        <div class="product-info">
            <p><strong>Name:</strong> <%= p.getProductName() %></p>
            <p><strong>Category:</strong> <%= p.getProduCategory() %></p>
            <p><strong>Description:</strong> <%= p.getProductDescription() %></p>
            <p><strong>Price:</strong> Rs.<%= p.getProductPrice() %></p>
            <p><strong>Availability:</strong> In Stock</p>
            <div class="add-to-cart">
            	<form action="/addtocart"  method="post">
            		<input type="hidden" name="PId" value="<%= p.getProductId() %>">
                	<input type="submit" value="Add to Cart">
                </form>
            </div>
        </div>
    </div>

</div>

    <%@include file="footer.jsp" %>
	
</body>
</html>


