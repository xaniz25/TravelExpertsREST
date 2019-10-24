<%@ include file="head.jsp" %>
  <title>Travel Experts Agents - Add Booking</title>
</head>
<body>
<%@ include file="nav.jsp"%>
	<div class="contain">
   		<div id="formbg">
			<form action="bookings.jsp?reload" onsubmit="addBooking(this)">
			<p id="registerError" style="font-size: 18px; visibility: hidden; color: red">Please complete form and check format!</p>
				<table>
					<tr><td>Customer ID:</td>
						<td><input type="number" name="customerId" id="customerId" /></td>
					</tr>
					<tr><td>Traveler Count:</td>
						<td><input type="number" name="travelerCount" id="travelerCount" /></td>
					</tr>	
					<tr><td>Trip Type:</td>
						<td><select name="tripType">
							<option value="Leisure">Leisure</option>
							<option value="Business">Business</option>
							<option value="Group">Group</option>
						</select></td>
					</tr>
					<tr><td>Package ID:</td>
						<td><input type="number" name="packageId" id="packageId" /></td>
					</tr>
					<tr><td>Trip Start:</td>
						<td><input type="date" name="tripStart" id="tripStart" /></td>
					</tr>
					<tr><td>Trip End:</td>
						<td><input type="date" name="tripEnd" id="tripEnd" /></td>
					</tr>
				</table>
				<button onclick="return validateAddBooking()" value="submit">Add</button>
			</form>
		</div>
	</div>
</body>
</html>