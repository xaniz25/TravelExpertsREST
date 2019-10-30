<%-- Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers--%>

<%-- Agents can modify booking. Redirects from bookings.jsp --%>

<%@ include file="head.jsp" %>
  <title>Travel Experts Agents - Modify Booking</title>
</head>
<body onload="getBooking(<%=request.getParameter("BookingId")%>)">
<%@ include file="nav.jsp"%>
	<div class="contain">
   		<div id="formbg">
			<form action="bookings.jsp?reload" onSubmit="updateBooking(this)">
			<p id="registerError" style="font-size: 18px; visibility: hidden; color: red">Please complete form and check format!</p>
				<table>
					<tr><td>Booking ID:</td>
						<td><input type="number" name="bookingId" id="bookingId" /></td>
					</tr>
					<tr><td>Booking Date:</td>
						<td><input type="date" name="bookingDate" id="bookingDate" /></td>
					</tr>
					<tr><td>Customer ID:</td>
						<td><input type="number" name="customerId" id="customerId"/></td>
					</tr>
					<tr><td>Traveler Count:</td>
						<td><input type="number" name="travelerCount" id="travelerCount" /></td>
					</tr>
					<tr><td>Trip Type:</td>
						<td><select name="tripType" id="tripType">
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
				<button onclick="return validateModifyBooking()">Edit</button>
				<button onclick="deleteBooking(<%=request.getParameter("BookingId")%>)">Delete</button>
			</form>
		</div>
	</div>
</body>
</html>