<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Customer Login</title>
</head>
<body>
<% if(session.getAttribute("customerId")!=null){
response.sendRedirect("customerwelcome.jsp");
}else{
%>
	<form action="CustomerLogin" method="post">
		UserID:<input type="text" name="custUserId"/><br/>
		Password: <input type="text" name="custUserPwd"/><br/>
		<button>Login</button>
	</form>
<% } %> <%--else--%>
</body>
</html>