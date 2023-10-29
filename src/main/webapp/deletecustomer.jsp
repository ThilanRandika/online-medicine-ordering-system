<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<style type="text/css">
		table {
  			border-collapse: collapse;
		}

		table, th, td {
		  border: 1px solid black;
		}
	</style>
</head>
<body>

	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String userName = request.getParameter("uname");
		String password = request.getParameter("pass");
		String address = request.getParameter("address");
	%>
	
	
	<form action="delete" method="post">
	<table>
		<tr>
			<td>Customer ID</td>
			<td><input type="text" name="cusid" value="<%= id %>" readonly></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" name="name" value="<%= name %>"readonly></td>
		</tr>
		<tr>
		<td>Email</td>
		<td><input type="text" name="email" value="<%= email %>"readonly></td>
	</tr>
	<tr>
		<td>Phone number</td>
		<td><input type="text" name="phone" value="<%= phone %>"readonly></td>
	</tr>
	<tr>
		<td>User name</td>
		<td><input type="text" name="uname" value="<%= userName %>"readonly></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="pass" value="<%= password %>"readonly></td>
	</tr>		
	</table>
	<br>
	<input type="submit" name="submit" value="Delete My Data">
	</form>

</body>
</html>