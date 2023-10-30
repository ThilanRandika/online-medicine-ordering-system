<!DOCTYPE html>
<html>
<head>
    <title>Medicine Ordering System</title>
    <link rel="stylesheet" type="text/css" href="navigationBarcss.css">

    <!-- Font Awesome CDN link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>
    <header>
        <nav class="navbar">
            <div class="logo">

                <a href="#"><img src="system_images\logo.png" alt="Logo"></a>
            </div>
            <ul class="nav-links">
                <li><a href="Home_registeredCus.jsp">Home</a></li>
                <li><a href="allProduct.jsp">Products</a></li>
                <li>

                    <form class="search-bar" id="search-form" action="SearchProductServlet" method="post">
				        <input type="text" id="search-input" name="searchTerm" placeholder="Search">
				        <button type="submit" id="search-button">Search</button>
				    </form>
                </li>
                
                <li id="prescription-tab"><a href="#"><i class="fas fa-file-medical"></i> Add Prescription</a></li>
                <li id="view-prescription-tab"><a href="#"><i class="fas fa-file-alt"></i> View Prescription</a></li>
                <li id="cart-tab"><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
                <li id="profile-tab"><a href="#"><i class="align-right fas fa-user"></i></a></li>
                <li id="logout-tab"><a href="#"><i class="align-right fas fa-sign-out-alt"></i></a></li>

            </ul>
        </nav>
    </header>

    <!-- Your page content here -->

    <script>

        var loggedIn = true; // Change this to true when the user is logged in

        if (loggedIn) {
            document.getElementById("cart-tab").style.display = "block";
            document.getElementById("profile-tab").style.display = "block";
            document.getElementById("prescription-tab").style.display = "block";
            document.getElementById("view-prescription-tab").style.display = "block";
            document.getElementById("logout-tab").style.display = "block";
        } else {
            document.getElementById("cart-tab").style.display = "none";
            document.getElementById("profile-tab").style.display = "none";
            document.getElementById("prescription-tab").style.display = "none";
            document.getElementById("view-prescription-tab").style.display = "none";

            document.getElementById("logout-tab").style.display = "none";
        }
    </script>
</body>
</html>
