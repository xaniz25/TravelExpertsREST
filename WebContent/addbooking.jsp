<%@ include file="head.jsp" %>
  <title>Travel Experts Agents - Add Booking</title>
</head>
<body>
<%@ include file="nav.jsp"%>
	<div class="contain">
   		<div id="formbg">
			<form action="bookings.jsp">
				Customer ID: <input type="number" name="customerId" /><br />
				Traveler Count: <input type="number" name="travelerCount" /><br />
				Trip Type: <select name="tripType">
					<option value="Leisure">Leisure</option>
					<option value="Business">Business</option>
					<option value="Group">Group</option>
				</select><br />
				Package ID: <input type="number" name="packageId" /><br />
				<button onclick="addBooking(this.form)">Add</button>
			</form>
		</div>
	</div>
</body>
</html>