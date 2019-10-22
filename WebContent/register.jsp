<%@ include file="head.jsp" %>
  <title>Travel Experts - Register</title>
</head>
<body>
<%@ include file="nav.jsp" %>
<div class="contain-reg">
   <!--Registration Form-->
    <div id="formbg"><p id="reg">Register below</p>
		<p id="registerError" style="font-size: 18px; visibility: hidden; color: red">Please complete form and check format!</p>
		<form action="registerthankyou.jsp" onSubmit="addCustomer(this)">
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
				<tr><td>Postal (A1A 1A1):</td>
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
					<td><input type="text" name="custPhone" id="custPhone" /></td>
				</tr>
				<tr><td>Email:</td>
					<td><input type="text" name="custEmail" id="custEmail" /></td>
				</tr>
				<tr><td>User ID:</td>
					<td><input type="text" name="custUserID" id="custUserId" /></td>
				</tr>
				<tr><td>Password (max 8 characters):</td>
					<td><input type="password" name="custUserPwd" id="custUserPwd"/></td>
				</tr>
				<tr><td>Confirm Password:</td>
					<td><input type="password" id="confirmPwd"/></td>
				</tr>
			</table>
			<button onClick="return resetForm()" value="reset">Clear</button>
			<button onClick="return validateRegForm()" value="submit">Register</button>
		</form>
	</div>
	</div>
<%@ include file="foot.jsp" %>