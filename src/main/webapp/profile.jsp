<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Application</title>
</head>
<%@ page import="com.ex.*" %>
<%String userName = (String)session.getAttribute("username");%>
<% User u = (User)request.getAttribute("uobj");%>
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
	
		<h1 align="center">Your Profile</h1>
		<table border="2" width="60%" height="200" cellpading="20" align="center">
			<tr>
				<td>Id</td>
				<td>ST<%=u.getId()%></td>
			</tr>
			<tr>
				<td>User Name</td>
				<td><%=u.getUsername()%></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><%=u.getEmail()%></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><%=u.getPhone()%></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><%=u.getAddress()%></td>
			</tr> 
		</table>

</body>
</html>