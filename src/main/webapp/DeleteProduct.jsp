<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.product.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Details (Admin Delete)</title>
    <link rel="stylesheet" type="text/css" href="DeleteProduct.css">
    <link rel="stylesheet" href="AdminDashBoardcss.css">
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
                <li class="navList ">
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
                <li class="navList active">
                    <a href="productDetailPage.jsp">
                        <ion-icon name="star-half-outline"></ion-icon>
                        <span class="links">Product Delete</span>
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

    <div class="container">
        <h1>Delete Product Details</h1>
        <form action="delete" method="post" enctype="multipart/form-data">
            <div class="product-details">
	              	<div class="product-image">
	                  <img src="<%= request.getContextPath() %>/productImage/<%= ((Product) session.getAttribute("deleteProduct")).getProductImage() %>" alt="Product Image">
	                  <p><strong>Image:</strong> 
	                  </p>
	               </div>
	               <div class="product-info">
	              	<p><strong>Id:</strong> 
	                      <input type="text" name="productId" value="<%= ((Product) session.getAttribute("deleteProduct")).getProductId() %>" readonly>
	                  </p>
	                  <p><strong>Name:</strong>
	                      <input type="text" name="productName" value="<%= ((Product) session.getAttribute("deleteProduct")).getProductName() %>" readonly>
	                  </p>
	                  <p><strong>Category:</strong> 
	                      <input type="text" name="productCategory" value="<%= ((Product) session.getAttribute("deleteProduct")).getProduCategory() %>" readonly>
	                  </p>
	                  <p><strong>Description:</strong> 
	                      <textarea name="productDescription" rows="4" cols="50" readonly><%= ((Product) session.getAttribute("deleteProduct")).getProductDescription() %></textarea>
	                  </p>
	                  <p><strong>Price:</strong> 
	                      <input type="text" name="productPrice" value="<%= ((Product) session.getAttribute("deleteProduct")).getProductPrice() %>" readonly>
	                  </p>
	                  <p><strong>Quantity:</strong> 
	                      <input type="text" name="productQuantity" value="<%= ((Product) session.getAttribute("deleteProduct")).getProductQuantity() %>" readonly>
	                  </p>
	                  <div class="add-to-cart">
	                      <input type="submit" value="Confirm Delete">
	                  </div>
	              	</div>
            </div>
        </form>
    </div>
    
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
