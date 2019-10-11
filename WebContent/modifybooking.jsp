<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Agents - Modify Booking</title>
<script src="jquery.js"></script>
<script>
function getBooking(id, myform){
	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/booking/getbooking/" + id,
		data: data,
		type:"GET",
		contentType:"application/json",
		dataType:"text",
		complete: function(req, stat){ $("#result").html(stat); }
	});
	
	var data = '{"bookingId":' + myform.packageId.value
		+ ',"bookingDate":"' + myform.bookingDate.value
		+ '","bookingNo":"' + myform.bookingNo.value
		+ '","travelerCount":' + myform.travelerCount.value
		+ ',"customerId":' + myform.customerId.value
		+ ',"tripTypeId":"' + myform.tripTypeId.value
		+ '","packageId":' + myform.packageId.value + '}';
		
		console.log("data:" + data);
}

function updateBooking(myform){
	var data = '{"bookingId":' + myform.packageId.value
		+ ',"bookingDate":"' + myform.bookingDate.value
		+ '","bookingNo":"' + myform.bookingNo.value
		+ '","travelerCount":' + myform.travelerCount.value
		+ ',"customerId":' + myform.customerId.value
		+ ',"tripTypeId":"' + myform.tripTypeId.value
		+ '","packageId":' + myform.packageId.value + '}';
		
		console.log("data:" + data);

	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/booking/postbooking",
		data: data,
		type:"POST",
		contentType:"application/json",
		dataType:"text",
		complete: function(req, stat){ $("#result").html(stat); }
	});
}

function deleteBooking(id){
	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/booking/deletebooking/" + id,
		data: '{"bookingId":'+id+'}',
		type:"DELETE",
		contentType:"application/json",
		dataType:"text",
		complete: function(req, stat){ $("#result").html(stat); }
	});
}
</script>
</head>
<body>
<% int id = Integer.parseInt(request.getParameter("BookingId")); %>
	<form onload="getBooking(<%=id%>, this)">
		Booking ID: <input type="number" name="bookingId" id="bookingId"/><br />
		Booking No: <input type="text" name="bookingNo" /><br />
		Booking Date: <input type="datetime-local" name="bookingDate" /><br />
		Traveler Count: <input type="number" name="travelerCount" /><br />
		Trip Type: <input type="text" name="tripTypeId" /><br />
		Package ID: <input type="number" name="packageId" /><br />
		<button onclick="updateBooking(this.form)">Edit</button>
		<button onclick="deleteBooking(<%=id%>)">Delete</button>
	</form>
</body>
</html>