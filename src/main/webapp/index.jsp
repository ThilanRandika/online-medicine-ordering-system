<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Home Guest</title>
    <link rel="stylesheet" type="text/css" href="navigationBarcss.css">
    <link rel="stylesheet" type="text/css" href="index.css">
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
            <li><a href="login.jsp">Prescriptions</a></li>
            <li>
                <div class="search-bar">
                    <input type="text" placeholder="Search">
                    <button type="submit">Search</button>
                </div>
            </li>
            <li><a href="login.jsp">Log In</a></li> <!-- Add a login link for guests -->
        </ul>
    </nav>
</header>

<main class="content">
    <section class="welcome-section">
        <h1>Welcome to our Medicine Ordering System</h1>
        <p>Your trusted source for ordering medicines online.</p>
    </section>

    <section class="featured-products">
        <h2>Featured Products</h2>
      
    </section>
</main>

<%@include file="footer.jsp" %>

<footer>
    <div class="footer-content">
        <p>&copy; 2023 Medicine Ordering System</p>
    </div>
</footer>

</body>
</html>