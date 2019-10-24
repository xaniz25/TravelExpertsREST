<%@ include file="head.jsp" %>
  <title>Travel Experts Agents - Your Account</title>
</head>
<body onload="getCustomer(<%=session.getAttribute("customerId")%>)">
<%@ include file="nav.jsp"%>
<% if(session.getAttribute("customerId")==null){
out.print("<h1>Please login</h1>");
response.sendRedirect("customerlogin.jsp");
}else{
%>
	<div class="contain">
		<div id="formbg">
			<p>Your Account Information</p>
			<form action="accountupdated.jsp" onSubmit="updateAccount(<%=session.getAttribute("customerId")%>, this)">
				<table>
				<tr><td>First Name:</td>
					<td><input type="text" name="custFirstName" id="custFirstName"/></td>
				</tr>
				<tr><td>Last Name:</td>
					<td><input type="text" name="custLastName" id="custLastName" /></td>
				</tr>
				<tr><td>Address:</td>
					<td><input type="text" name="custAddress" id="custAddress" /></td>
				</tr>
				<tr><td>City:</td>
					<td><input type="text" name="custCity" id="custCity" /></td>
				</tr>	
				<tr><td>Province:</td>
					<td><input type="text" name="custProv" id="custProv" /></td>
				</tr>
				<tr><td>Postal:</td>
					<td><input type="text" name="custPostal" id="custPostal" /></td>
				</tr>
				<tr><td>Country:</td>
					<td><select name="custCountry">
						<option value='Canada'>Canada</option>
						<option value='United States'>United States</option>
						</select></td>
				</tr>
				<tr><td>Phone:</td>
					<td><input type="text" name="custPhone" id="custPhone" /></td>
				</tr>
				<tr><td>Email:</td>
					<td><input type="text" name="custEmail" id="custEmail"/></td>
				</tr>
				<tr><td>User ID:</td>
					<td><input type="text" name="custUserId" id="custUserId"/></td>
				</tr>
				<tr><td>Password:</td>
					<td><input type="password" name="custUserPwd" id="custUserPwd" /></td>
				</tr>
				<tr><td>Confirm Password:</td>
					<td><input type="password" name="confirmPwd" id="confirmPwd"/></td>
				</tr>
				</table>
				<button onclick="return validateAcct()" value="submit">Edit</button>
			</form>
			</br>
			<a href="customerwelcome.jsp"><button>Home</button></a>
<% } %> <%--else--%>
		</div>
	</div>
</body>
</html>