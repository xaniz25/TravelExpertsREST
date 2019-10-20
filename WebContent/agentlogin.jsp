<%@ include file="head.jsp"%>
<title>Travel Experts - Agent Login</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<% if(session.getAttribute("agentId")!=null){
	response.sendRedirect("agentwelcome.jsp");
}else{
	if(request.getParameter("login")=="invalid"){
		out.println("<p id='error'>Invalid UserID or Password"); }
%>
	<div class="contain">
	    <div id="login">
			<form onSubmit="return checkLogin()" action="AgentLogin" method="post">
				<p>Agent Login</p>
				<table>
					<tr><td>UserID:</td>
						<td><input type="text" name="agtUserId" id="uid"/></td>
					</tr>
					<tr><td>Password:</td>
						<td><input type="text" name="agtUserPwd" id="pwd"/></td>
					</tr>
				</table>
				<button>Login</button>
			</form>
<% } %> <%--else--%>
		</div>
	</div>
</body>
</html>