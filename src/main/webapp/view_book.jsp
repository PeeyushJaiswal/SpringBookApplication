<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ex.*" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Application</title>
</head>

<%String userName = (String)session.getAttribute("username");%>
<% List<Book> books = (List<Book>)request.getAttribute("books");%>
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
	
		<h1 align="center">Your Books</h1>
		<h2 align="center"><%
			String s = (String)request.getAttribute("delete");
			if(s!=null){
				out.print("Book deleted!!");
			}
		%></h2>
		<table border="2" width="60%" height="200" cellpading="20" align="center">
			<tr>
				<td>Book Id</td>
				<td>Book Name</td>
				<td>Author</td>
				<td>Delete</td>
			</tr>
			<% for(Book b:books){ %>
				<tr>
					<td><%=b.getBid() %></td>
					<td><%=b.getBookname() %></td>
					<td><%=b.getAuthor() %></td>
					<td><form action="delBk">
							<input type="hidden" name="bid" value="<%=b.getBid()%>">
							<input type="submit" value="Delete">
						</form>
					</td>
				</tr>
			<%} %>
		</table>
</body>
</html>