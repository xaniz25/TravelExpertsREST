<%@ include file="head.jsp" %>
  <title>Travel Experts Agents - Modify Customer</title>
</head>
<body onload="getCustomer(<%=request.getParameter("CustomerId")%>)">
<%@ include file="nav.jsp"%>
	<div class="contain">
   		<div id="formbg">
   			<p id="registerError" style="font-size: 18px; visibility: hidden; color: red">Please complete form and check format!</p>
			<form action="customers.jsp?reload" onSubmit="updateCustomer(this)">
				<table>
					<tr><td>Customer ID:</td>
						<td><input type="number" name="customerId" id="customerId"/></td>
					</tr>
					<tr><td>First Name:</td>
						<td><input type="text" name="custFirstName" id="custFirstName" /></td>
					</tr>
					<tr><td>Last Name:</td>
						<td><input type="text" name="custLastName" id="custLastName"/></td>
					</tr>
					<tr><td>Address:</td>
						<td><input type="text" name="custAddress" id="custAddress" /></td>
					<tr><td>City:</td>
						<td><input type="text" name="custCity" id="custCity"/></td>
					</tr>
					<tr><td>Province:</td>
						<td><input type="text" name="custProv" id="custProv"></td>
					</tr>
					<tr><td>Postal:</td>
						<td><input type="text" name="custPostal" id="custPostal" /></td>
					</tr>
					<tr><td>Country:</td>
						<td><select name="custCountry" onchange="loadprovinces(this.value)">
							<option value='Canada'>Canada</option>
							<option value='United States'>United States</option>
							</select></td>
					</tr>
					<tr><td>Phone:</td>
						<td><input type="text" name="custPhone" id="custPhone" /></td>
					</tr>
					<tr><td>Email:</td>
						<td><input type="text" name="custEmail" id="custEmail" /></td>
					</tr>
					<tr><td>User ID:</td>
						<td><input type="text" name="custUserId" id="custUserId" /></td>
					</tr>
				</table>
				<button onclick="return validateModifyCust()" value="submit">Edit</button>
				<button onclick="deleteCustomer(<%=request.getParameter("CustomerId")%>)">Delete</button>
			</form>
		</div>
	</div>
</body>
</html>