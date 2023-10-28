<!DOCTYPE html>
<html>
<head>
    <title>Medicine Ordering System</title>
    <link rel="stylesheet" type="text/css" href="navigationBarcss.css">
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <a href="#"><img src="logo.png" alt="Logo"></a>
            </div>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>
                <li><a href="AdminproductListPage.jsp">Products</a></li>
                <li>
                    <div class="search-bar">
                        <input type="text" placeholder="Search">
                        <button type="submit">Search</button>
                    </div>
                </li>
                <li id="cart-tab"><a href="#">Cart</a></li>
                <li id="profile-tab"><a href="#">Profile</a></li>
                <li id="logout-tab"><a href="#">Logout</a></li>
            </ul>
        </nav>
    </header>

    <!-- Your page content here -->

    <script>
        // Assume loggedIn is a variable that indicates whether the user is logged in or not
        var loggedIn = true; // Change this to true when the user is logged in

        if (loggedIn) {
            // User is logged in, show the appropriate navigation items
            document.getElementById("cart-tab").style.display = "block";
            document.getElementById("profile-tab").style.display = "block";
            document.getElementById("logout-tab").style.display = "block";
        } else {
            // User is not logged in, hide the login-related navigation items
            document.getElementById("cart-tab").style.display = "none";
            document.getElementById("profile-tab").style.display = "none";
            document.getElementById("logout-tab").style.display = "none";
        }
    </script>
</body>
</html>
