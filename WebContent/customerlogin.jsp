<%@ include file="head.jsp"%>
<title>Travel Experts - Customer Login</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<% if(session.getAttribute("customerId")!=null){
	response.sendRedirect("customerwelcome.jsp");
}else{
%>
	<div class="contain">
	    <div id="login">
			<form onSubmit="return checkLogin()" action="CustomerLogin" method="post">
	    	<% if(request.getParameter("login")=="invalid"){
	    		out.println("<p id='error'>Invalid UserID or Password"); } %>
				<p>Customer Login</p>
				<table>
					<tr><td>UserID:</td>
						<td><input type="text" name="custUserId" id="uid" /></td>
					</tr>
					<tr><td>Password:</td>
						<td><input type="text" name="custUserPwd" id="pwd" /></td>
					</tr>
				</table>
				<button>Login</button>
			</form>
<% } %> <%--else--%>
		</div>
	</div>
</body>
</html>