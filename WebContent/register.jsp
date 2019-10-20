<%@ include file="head.jsp" %>
  <title>Travel Experts - Register</title>
</head>
<body>
<%@ include file="nav.jsp" %>
<div class="contain">
   <!--Registration Form-->
    <div id="formbg"><p>Register below:</p>
		<p id="registerError" style="font-size: 18px; visibility: hidden; color: red">Please complete form and check format!</p>
		<form action="registerthankyou.jsp" onSubmit="return validateForm()">
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
					<td><select name="custProv" id="custProv">
						<option value=''>Select One...</option>
						</select><br /></td>
				</tr>
				<tr><td>Postal:</td>
					<td><input type="text" name="custPostal" id="custPostal" /></td>
				</tr>
				<tr><td>Country:</td>
					<td><select name="custCountry" onchange="loadprovinces(this.value)">
						<option value=''>Select One...</option>
						<option value='Canada'>Canada</option>
						<option value='United States'>United States</option>
						</select></td>
				</tr>
				<tr><td>Phone:</td>
					<td><input type="text" name="custPhone" /></td>
				</tr>
				<tr><td>Email:</td>
					<td><input type="text" name="custEmail" /></td>
				</tr>
				<tr><td>User ID:</td>
					<td><input type="text" name="custUserID" /></td>
				</tr>
				<tr><td>Password:</td>
					<td><input type="password" name="custUserPwd" /></td>
				</tr>
				<tr><td>Confirm Password:</td>
					<td><input type="password" /></td>
				</tr>
			</table>
			<button onClick="return resetForm()" type="reset" value="reset">Clear</button>
			<button onclick="addCustomer(this.form)">Register</button>
		</form>
	</div>
	</div>
</body>
</html>