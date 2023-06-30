<%@page import="org.hibernate.internal.build.AllowSysOut"%>
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
	if(s=="success"){
		out.print("Registered Successfully!!");
	}
	%></h2>
	<h1 align="center">
		<a href="register.jsp">Register</a> |
		<a href="login.jsp">Login</a>
	</h1>
</body>
</html>