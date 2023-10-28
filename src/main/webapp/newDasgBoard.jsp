<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import="java.io.IOException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="newDasgBoard.css">
    <link rel="stylesheet" type="text/css" href="AdminDashBoardcss.css">
</head>
<body>
<%
List<String> labels = new ArrayList<>();
List<Integer> data = new ArrayList<>();
int pCount = 0;

try {
	Class.forName("com.mysql.jdbc.Driver");
	
	 String url = "jdbc:mysql://localhost:3306/oop_project?useSSL=false";
	 String username = "root";
	 String password = "sandeep";
	 Connection con;
	
	con = DriverManager.getConnection(url, username, password);
	
	String sql = "select Pcatogary, count(productid) as numberOfProducts from product group by Pcatogary";
	PreparedStatement preparedStatement = con.prepareStatement(sql);
	
	 ResultSet rs = preparedStatement.executeQuery();
	 
	 
	 String sql2 = "select count(productid) as productsCount from product";
		PreparedStatement preparedStatement2 = con.prepareStatement(sql2);
		
		 ResultSet rs2 = preparedStatement2.executeQuery();
	
	while (rs.next()) {
        labels.add(rs.getString("Pcatogary"));
        data.add(rs.getInt("numberOfProducts"));
    }
	
	if(rs2.next()) {
		pCount = rs2.getInt("productsCount");
	}
	
	con.close();
	
}catch(Exception e){
	e.printStackTrace();
}

%>

    <nav>
        <div class="menu-items">
            <ul class="navLinks">
                <li class="navList active">
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
    <main>
        <section id="dashboard">
            <h2>Dashboard Overview</h2>
        
        <div class="container">
        <h1>Welcome, Admin!</h1>
        
        <div class="admin-options">
            <div class="admin-option">
                <a href="AdminproductListPage.jsp">Manage Products</a>
            </div>
            <div class="admin-option">
                <a href="UserManagement.jsp">Manage Users</a>
            </div>
            <!-- Add more admin options as needed -->
        </div>
    </div>

            <!-- Sample Widgets -->
            <div class="widget">
                <h3>Total Users</h3>
                <p>100</p>
            </div>

            <div class="widget">
                <h3>Total Products</h3>
                <p><%= pCount %></p>
            </div>

            <!-- Sample Chart -->
            <div class="chart">
        <h3>Monthly Sales</h3>
        <canvas id="myChart" width="400" height="200"></canvas>
    </div>
    <script>
    var chartLabels = [
        <% List<String> catagory = labels;
           if (catagory != null) {
               for (int i = 0; i < catagory.size(); i++) {
                   out.print('"'+ catagory.get(i) + '"');
                   if (i < catagory.size() - 1) {
                       out.print(", ");
                   }
               }
           }
        %>
    ];
    
    var chartData = [
        <% List<Integer> catagoryNum = data;
           if (catagoryNum != null) {
               for (int i = 0; i < catagoryNum.size(); i++) {
                   out.print(catagoryNum.get(i));
                   if (i < catagoryNum.size() - 1) {
                       out.print(", ");
                   }
               }
           }
        %>
    ];


        var data = {
            labels: chartLabels,
            datasets: [{
                label: "Sales",
                data: chartData,
                backgroundColor: 'rgba(75, 192, 192, 20)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        };

        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: data,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

            <!-- Sample Table -->
            <div class="table">
                <h3>Recent Orders</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Product</th>
                            <th>Customer</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Product A</td>
                            <td>John Doe</td>
                            <td>Shipped</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Product B</td>
                            <td>Jane Smith</td>
                            <td>Pending</td>
                        </tr>
                        <!-- Add more table rows as needed -->
                    </tbody>
                </table>
            </div>
            <!-- Sample Pie Chart -->
<div class="chart">
    <h3>Sales Distribution</h3>
    <canvas id="myPieChart" width="100" height="50"></canvas>
</div>
<script>
var chartLabels = [
    <% List<String> product = labels;
       if (catagory != null) {
           for (int i = 0; i < catagory.size(); i++) {
               out.print('"'+ catagory.get(i) + '"');
               if (i < catagory.size() - 1) {
                   out.print(", ");
               }
           }
       }
    %>
];

var chartData = [
    <% List<Integer> sales = data;
       if (catagoryNum != null) {
           for (int i = 0; i < catagoryNum.size(); i++) {
               out.print(catagoryNum.get(i));
               if (i < catagoryNum.size() - 1) {
                   out.print(", ");
               }
           }
       }
    %>
];

    var data = {
        labels: chartLabels,
        datasets: [{
            data: chartData,
            backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(153, 102, 255, 0.2)',
            ],
            borderColor: [
                'rgba(75, 192, 192, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(153, 102, 255, 1)',
            ],
            borderWidth: 1
        }]
    };

    var ctx = document.getElementById('myPieChart').getContext('2d');
    var myPieChart = new Chart(ctx, {
        type: 'pie',
        data: data,
    });
</script>
            
            
        </section>
    </main>
    <footer>
        <p>&copy; 2023 Your Company Name</p>
    </footer>
    
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
