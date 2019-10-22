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
			<form action="CustomerLogin" method="post">
				<p>Customer Login</p>
	    		<% if(request.getParameter("login")=="invalid"){ %>
	    		<p id='error'>Invalid UserID or Password!</p>
	    		<% } %>
				<p id="loginError" style="font-size: 18px; visibility: hidden; color: red">Invalid UserID or Password!</p>
				<table>
					<tr><td>UserID:</td>
						<td><input type="text" name="custUserId" id="uid" /></td>
					</tr>
					<tr><td>Password:</td>
						<td><input type="password" name="custUserPwd" id="pwd" /></td>
					</tr>
				</table>
				<button onClick="return checkLogin()">Login</button>
			</form>
			<a href="register.jsp"><button id="regbtn">Register</button></a>
<% } %> <%--else--%>
		</div>
	</div>
</body>
</html>