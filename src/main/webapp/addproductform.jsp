
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.product.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Product</title>
    <link rel="stylesheet" type="text/css" href="addproduct.css" >
    <link rel="stylesheet" href="AdminDashBoardcss.css">
</head>
<body>

<nav>
        <div class="menu-items">
            <ul class="navLinks">
                <li class="navList">
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
                    <a href="addproductform.jsp">
                        <ion-icon name="star-half-outline"></ion-icon>
                        <span class="links">Add Product</span>
                    </a>
                </li>
               
            </ul>
            <ul class="bottom-link">
                <li class="navList">
                    <a href="AdminProfile.jsp">
                        <ion-icon name="person-circle-outline"></ion-icon>
                        <span class="links">Profile</span>
                    </a>
                </li>
                <li class="navList">
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
        <h1>Add Product</h1>
        <form action="productinsert" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="productName">Product Name:</label>
                <input type="text" name="productName" id="productName" required>
            </div>
            <div class="form-group">
                <label for="productCategory">Product Category:</label>
                <input type="text" name="productCategory" id="productCategory" required>
            </div>
            <div class="form-group">
                <label for="productDescription">Product Description:</label>
                <textarea name="productDescription" id="productDescription"></textarea>
            </div>
            <div class="form-group">
                <label for="productPrice">Product Price:</label>
                <span>Rs.</span>
                <input type="text" name="productPrice" id="productPrice" required>
            </div>
            <div class="form-group">
                <label for="productQuantity">Product Quantity:</label>
                <input type="text" name="productQuantity" id="productQuantity" required>
            </div>
            <div class="form-group">
                <label for="photo1">Product Photo 1 (Max 100MB):</label>
                <input type="file" name="image" id="photo1" required>
            </div>
            <input type="submit" value="Add Product">
        </form>
    </div>
</section>


<script>
    function validateForm() {
        const productPrice = document.getElementById("productPrice").value;
        const productQuantity = document.getElementById("productQuantity").value;
        const image = document.getElementById("photo1").files[0];

        // Check if Product Price and Quantity are valid integers
        if (!Number.isInteger(parseInt(productPrice)) || !Number.isInteger(parseInt(productQuantity))) {
            alert("Product Price and Quantity must be valid integers.");
            return false;
        }

        // Check image size (in bytes)
        if (image && image.size > 100 * 1024 * 1024) { // 100MB
            alert("Image size exceeds the 100MB limit.");
            return false;
        }

        return true;
    }
</script>
    
    
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
