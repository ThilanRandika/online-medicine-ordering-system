<!-- product.jsp -->
<%@page import = "com.product.DBconnect" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import = "com.product.productDB" %>
<%@page import = "java.util.*" %>
<%@page import = "com.product.Product" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title>Product Details</title>
    <link rel="stylesheet" href="AdminProductListPagecss.css">
    <link rel="stylesheet" href="AdminDashBoardcss.css">
    <link rel="stylesheet" href="navigationBarcss.css">
</head>
<body>
<nav>
        <div class="menu-items">
            <ul class="navLinks">
                <li class="navList ">
                    <a href="newDasgBoard.jsp">
                        <ion-icon name="home-outline"></ion-icon>
                        <span class="links">Dashboard</span>
                    </a>
                </li>
                <li class="navList active">
                    <a href="AdminproductListPage.jsp">
                        <ion-icon name="folder-outline"></ion-icon>
                        <span class="links">Products</span>
                    </a>
                </li>
                <li class="navList">
                    <a href="">
                        <ion-icon name="ticket-outline"></ion-icon>
                        <span class="links">Staff</span>
                    </a>
                </li>
                <li class="navList">
                    <a href="#">
                        <ion-icon name="ticket-outline"></ion-icon>
                        <span class="links">Users</span>
                    </a>
                </li>
               
            </ul>
            <ul class="bottom-link">
                <li>
                    <a href="#">
                        <ion-icon name="person-circle-outline"></ion-icon>
                        <span class="links">Profile</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <ion-icon name="log-out-outline"></ion-icon>
                        <span class="links">Logout</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <section class="dashboard">
        <div class="container">
        
            
        

<%
	List<Product> product = new ArrayList<Product>();
	product = productDB.getProductDetails();
%>

    
	
    <table>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Product Category</th>
            <th>Product Description</th>
            <th>Product Price</th>
            <th>Product Quantity</th>
            <th>Product Image</th>
            <th>Action</th>
        </tr>
	<%
		if(!product.isEmpty()) {
			for(Product p : product) {%>
				
        <tr>
            <td><%= p.getProductId() %></td>
            <td><%= p.getProductName() %></td>
            <td><%= p.getProduCategory() %></td>
            <td><%= p.getProductDescription() %></td>
            <td><%= p.getProductPrice() %></td>
            <td><%= p.getProductQuantity() %></td>
            
            <td><div><img src="<%= request.getContextPath() %>/productImage/<%= p.getProductImage()%>"></div></td>
            
            <td>
                <a href="UpdateProduct?Pid=<%= p.getProductId() %>" class="edit-button">Update</a>
                <a href="DeleteProduct?Pid=<%= p.getProductId() %>" class="delete-button">Delete</a>
            </td>
        </tr>
			<% }
			
		}
	%>
	
    </table>
    
 
    <a href="addproductform.jsp" class="add-product-button">Add Product</a>
    
   </div>
    </section>
    
    <script>
    document.querySelectorAll(".navList").forEach(function(element) {
        element.addEventListener('click', function() {
          
          document.querySelectorAll(".navList").forEach(function(e) {
            e.classList.remove('active');
        });

          // Add active class to the clicked navList element
          this.classList.add('active');
      
          // Get the index of the clicked navList element
          var index = Array.from(this.parentNode.children).indexOf(this);
      
          // Hide all data-table elements
          document.querySelectorAll(".data-table").forEach(function(table) {
            table.style.display = 'none';
          });
      
          // Show the corresponding table based on the clicked index
          var tables = document.querySelectorAll(".data-table");
          if (tables.length > index) {
            tables[index].style.display = 'block';
          }
        });
      });
    </script>
    
    <!-- Sources for icons -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>
