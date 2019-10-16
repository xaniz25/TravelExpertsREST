<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
session.invalidate();
response.sendRedirect("http://localhost:8080/TravelExperts/index.jsp");
%>
<h1>You have been logout</h1>
</body>
</html>