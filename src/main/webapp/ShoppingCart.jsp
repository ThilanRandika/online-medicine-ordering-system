<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "com.product.DBconnect" %>
<%@page import = "com.order.CartItem" %>
<%@page import = "com.order.cartDB" %>
<%@page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Shopping Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f4e7; /* Light green background color */
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f5f5f5;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: #007BFF;
        }
        a:hover {
            text-decoration: underline;
        }
        input[type="number"] {
            width: 40px;
        }
        /* Style for buttons */
        .button-container {
            display: flex;
            justify-content: space-between;
        }
        input[type="submit"] {
            background-color: #4CAF50; /* Light green */
            color: #fff; /* White text */
            border: none;
            padding: 10px 20px;
            border-radius: 5px; /* Rounded corners */
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049; /* Slightly darker green on hover */
        }
    </style>
</head>
<body>

<%
String Id = null;
	List<CartItem> product = new ArrayList<CartItem>();
	product = cartDB.RetrieveCartDetails(Id);
	
%>


    <div class="container">
        <h2>Your Shopping Cart</h2>
        <form action="UpdateCartServlet" method="post"> 
            <table>
                <tr>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th>Remove</th>
                </tr>
                
                <%
		if(!product.isEmpty()) {
			for(CartItem p : product) {%>
                    <tr>
                        <td><%= p.getProductName() %></td>
                        <td><%= p.getPrice() %></td>
                        <td>
                            <input type="text" name="quantity" value="<%= p.getQuantity() %>" >
                            <input type="hidden" name="productId" value="<%= p.getProductId() %>">
                        </td>
                        <td>${cartItem.subtotal}</td>
                        <td>
                            <form action="RemoveFromCartServlet" method="post">
                                <input type="hidden" name="customer_id" value="<%= p.getProductId() %>" /><!-- Form for remove items the cart -->
                                <input type="hidden" name="product_id" value="${customerId}" />
                                <input type="submit" value="Remove" />
                            </form>
                        </td>
                    </tr>
                    
                    <% }
			
		}
	%>
            </table>
            <p>Total Price: ${totalPrice}</p>
        <form action="ClearShoppingCart" method="post">
        	<input type="hidden" name="customer_id" value="${customerId}">
            <input type="submit" value="Update Cart">
        </form>
        <form action="ClearShoppingCart" method="post"> <!-- Form for clearing the cart -->
            <input type="hidden" name="customer_id" value="${customerId}">
            <input type="submit" value="Delete Cart">
        </form>
        <a href="checkout.jsp">Proceed to Checkout</a>
    </div>
</body>
</html>