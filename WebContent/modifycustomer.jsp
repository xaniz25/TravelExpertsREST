<%@ include file="head.jsp" %>
  <title>Travel Experts Agents - Modify Customer</title>
</head>
<body onload="getCustomer(<%=request.getParameter("CustomerId")%>); loadprovinces(this.value);">
<%@ include file="nav.jsp"%>
	<div class="contain">
   		<div id="formbg">
			<form action="customers.jsp?reload">
				Customer ID: <input type="number" name="customerId" id="customerId"/><br />
				First Name: <input type="text" name="custFirstName" id="custFirstName" /><br />
				Last Name: <input type="text" name="custLastName" id="custLastName"/><br />
				Address: <input type="text" name="custAddress" id="custAddress" /><br />
				City: <input type="text" name="custCity" id="custCity"/><br />
				Province: <input type="text" name="custProv" id="custProv"><br />
				Postal: <input type="text" name="custPostal" id="custPostal" /><br />
				Country: <select name="custCountry" onchange="loadprovinces(this.value)">
					<option value='Canada'>Canada</option>
					<option value='United States'>United States</option>
					</select><br />
				Phone: <input type="text" name="custPhone" id="custPhone" /><br />
				Email: <input type="text" name="custEmail" id="custEmail" /><br />
				User ID: <input type="text" name="custUserID" id= "custUserID" /><br />
				<button onclick="updateCustomer(this.form)">Edit</button>
				<button onclick="deleteCustomer(<%=request.getParameter("CustomerId")%>)">Delete</button>
			</form>
		</div>
	</div>
</body>
</html>