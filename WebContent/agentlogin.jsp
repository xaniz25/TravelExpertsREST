<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if(session.getAttribute("agentId")!=null){
response.sendRedirect("agentwelcome.jsp");
}else{
%>
	<form action="AgentLogin" method="post">
		UserID:<input type="text" name="agtUserId"/><br/>
		Password: <input type="text" name="agtUserPwd"/><br/>
		<button>Login</button>
	</form>
<% } %> <%--else--%>
</body>
</html>