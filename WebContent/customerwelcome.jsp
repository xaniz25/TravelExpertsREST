<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Customer Dashboard</title>
</head>
<body>
<% if(session.getAttribute("customerId")==null){
out.print("<h1>Please login</h1>");
response.sendRedirect("customerlogin.jsp");
}else{
%>

<h1>Welcome, <%=session.getAttribute("custFirstName") %>!</h1>
<a href="customerbookings.jsp">Your Bookings</a>
<a href="customerinfo.jsp">Your Account</a>
<a href="logout.jsp"><button>Logout</button></a>

<% } %> <%--else--%>

</body>
</html>