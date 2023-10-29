<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Profile</title>
    <link rel="stylesheet" type="text/css" href="AdminProfile.css">
    <link rel="stylesheet" type="text/css" href="AdminDashBoardcss.css">
    <!-- Add necessary stylesheets and scripts -->
</head>
<body>

    <!-- Navigation bar -->
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
                <li class="navList">
                    <a href="addproductform.jsp">
                        <ion-icon name="star-half-outline"></ion-icon>
                        <span class="links">Add Product</span>
                    </a>
                </li>
               
            </ul>
            <ul class="bottom-link">
                <li class="navList active">
                    <a href="#">
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

    <div class="profile-container">
        <div class="profile-info">
            <h1>Admin Profile</h1>
            <!-- Display Admin Information -->
            <div class="profile-details">
                <label>Full Name:</label>
                <p>John Doe</p>
            </div>
            <div class="profile-details">
                <label>Email:</label>
                <p>johndoe@example.com</p>
            </div>
            <!-- Add more profile information here -->
            
            <div class="profile-actions">
                <a href="editProfile.jsp">Edit Profile</a>
                <!-- Link to page where admin can edit the profile -->
            </div>
        </div>
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