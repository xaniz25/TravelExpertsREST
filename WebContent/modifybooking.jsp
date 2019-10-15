<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Modify Booking</title>
<script src="jquery.js"></script>
<script>
function getBooking(id){
	$.ajax({ url:"http://localhost:8080/TravelExperts/rs/booking/getbooking/" + id,
		type:"GET",
		dataType:"json",
		success: function(data){ handle(data); }
	});
}

function handle(data){
	$("#bookingId").val(data.bookingId);
	var date = new Date(data.bookingDate);
	$("#bookingDate").val(date.getFullYear() + '-' + ('0' + (date.getMonth()+1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2));
	$("#bookingNo").val(data.bookingNo);
	$("#travelerCount").val(data.travelerCount);
	$("#customerId").val(data.customerId);
	$("#tripTypeId").val(data.tripTypeId);
	$("#packageId").val(data.packageId);
	
}

function updateBooking(myform){
	var date = new Date(myform.bookingDate.value);
	
	var data = '{"bookingId":' + myform.bookingId.value
		+ ',"bookingDate":"' + date.getFullYear() + '-' + ('0' + (date.getMonth()+1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2)
		+ '","bookingNo":"' + myform.bookingNo.value
		+ '","travelerCount":' + myform.travelerCount.value
		+ ',"customerId":' + myform.customerId.value
		+ ',"tripTypeId":"' + myform.tripTypeId.value
		+ '","packageId":' + myform.packageId.value + '}';

	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/booking/postbooking",
		data: data,
		type:"POST",
		contentType:"application/json",
		dataType:"text"
	});
	
}

function deleteBooking(id){
	$.ajax({ url:"http://localhost:8080/TravelExperts/rs/booking/deletebooking/" + id, type:"DELETE" });
	window.location = 'http://localhost:8080/TravelExperts/bookings.jsp'
}
</script>
</head>
<body onload="getBooking(<%=request.getParameter("BookingId")%>)">
	<form action="bookings.jsp">
		Booking ID: <input type="number" name="bookingId" id="bookingId" /><br />
		Booking No: <input type="text" name="bookingNo" id="bookingNo" /><br />
		Booking Date: <input type="date" name="bookingDate" id="bookingDate" /><br />
		Customer ID: <input type="number" name="customerId" id="customerId"/><br />
		Traveler Count: <input type="number" name="travelerCount" id="travelerCount" /><br />
		Trip Type: <select name="tripTypeId" id="tripTypeId">
			<option value="L">Leisure</option>
			<option value="B">Business</option>
			<option value="G">Group</option>
			</select><br />
		Package ID: <input type="number" name="packageId" id="packageId" /><br />
		<button onclick="updateBooking(this.form)">Edit</button>
		<button onclick="deleteBooking(<%=request.getParameter("BookingId")%>)">Delete</button>
	</form>
</body>
</html>