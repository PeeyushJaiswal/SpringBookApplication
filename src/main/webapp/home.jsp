<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Application</title>
</head>
<%String userName = (String)session.getAttribute("username");
%>
<body bgcolor="wheat">
	<br><br><br>
	<h1 align="center">Welcome <%out.print(userName); %></h1>
	<br><br><br>
	
	<h1 align="center">
		<a href="home.jsp">Home</a> |
		<a href="profile">Profile</a> |
		<a href="add_book.jsp">Add Book</a> |
		<a href="view_book">View Book</a> |
		<a href="index.jsp">Logout</a>
	</h1>
</body>
</html>