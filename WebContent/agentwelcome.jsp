<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Agent Dashboard</title>
</head>
<body>
<% if(session.getAttribute("agentId")==null){
out.print("<h1>Please login</h1>");
response.sendRedirect("agentlogin.jsp");
}else{
%>
<h1>Welcome, <%=session.getAttribute("agtFirstName") %>!</h1>
<a href="bookings.jsp">Bookings</a>
<a href="packages.jsp">Packages</a>
<a href="customers.jsp">Customers</a>
<a href="logout.jsp"><button>Logout</button></a>

<% } %> <%--else--%>
</body>
</html>