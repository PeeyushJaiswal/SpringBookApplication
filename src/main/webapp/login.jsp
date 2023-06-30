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
	
	<h2 align="center"><%
	String s = (String)request.getAttribute("status");
	if(s=="valFailed"){
		out.print("Invalid username and password!!");
	}
	%></h2>
	
	<h1 align="center">
		<a href="register.jsp">Register</a> |
		<a href="login.jsp">Login</a>
	</h1>
	
	<h1 align="center">Login</h1>
	<form action="login" method="post" align="center">
		<input type="text" name="username" placeholder="Enter username">
		<input type="password" name="password" placeholder="Enter password">
		<input type="submit" value="Login">
	</form>
</body>
</html>