<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Application</title>
</head>
<body bgcolor="wheat">
	<br><br><br>
	<h1 align="center">Welcome to Book Application</h1>
	<br><br><br>
	
	<h1 align="center">
		<a href="register.jsp">Register</a> |
		<a href="login.jsp">Login</a>
	</h1>
	<h1 align="center">Register</h1>
	<form action="register" method="post" align="center">
		<input type="text" name="username" placeholder="Enter username">
		<input type="password" name="password" placeholder="Enter password">
		<input type="number" name="phone" placeholder="Enter phone no">
		<input type="email" name="email" placeholder="Enter email">
		<input type="text" name="address" placeholder="Enter address">
		<input type="submit" value="Register">
	</form>
</body>
</html>