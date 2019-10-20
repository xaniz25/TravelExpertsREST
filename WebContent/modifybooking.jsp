<%@ include file="head.jsp" %>
  <title>Travel Experts Agents - Modify Booking</title>
</head>
<body onload="getBooking(<%=request.getParameter("BookingId")%>)">
<%@ include file="nav.jsp"%>
	<div class="contain">
   		<div id="formbg">
			<form action="bookings.jsp?reload">
				Booking ID: <input type="number" name="bookingId" id="bookingId" /><br />
				Booking Date: <input type="date" name="bookingDate" id="bookingDate" /><br />
				Customer ID: <input type="number" name="customerId" id="customerId"/><br />
				Traveler Count: <input type="number" name="travelerCount" id="travelerCount" /><br />
				Trip Type: <select name="tripType" id="tripType">
					<option value="Leisure">Leisure</option>
					<option value="Business">Business</option>
					<option value="Group">Group</option>
					</select><br />
				Package ID: <input type="number" name="packageId" id="packageId" /><br />
				<button onclick="updateBooking(this.form)">Edit</button>
				<button onclick="deleteBooking(<%=request.getParameter("BookingId")%>)">Delete</button>
			</form>
		</div>
	</div>
</body>
</html>