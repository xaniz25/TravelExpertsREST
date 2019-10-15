<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Add Booking</title>
<script src="jquery.js"></script>
<script>
	function addBooking(myform)
	{
		var data = '{"bookingDate":"' + myform.bookingDate.value
			+ '","bookingNo":"' + myform.bookingNo.value
			+ '","travelerCount":' + myform.travelerCount.value
			+ ',"customerId":' + myform.customerId.value
			+ ',"tripTypeId":"' + myform.tripTypeId.value
			+ '","packageId":' + myform.packageId.value + '}';

		$.ajax({
			url:"http://localhost:8080/TravelExperts/rs/booking/putbooking",
			data: data,
			type:"PUT",
			contentType:"application/json",
			dataType:"text"
		});
	}
</script>
</head>
<body>
	<form>
		Customer ID: <input type="number" name="customerId" /><br />
		Booking No: <input type="text" name="bookingNo" /><br />
		Booking Date: <input type="date" name="bookingDate" /><br />
		Traveler Count: <input type="number" name="travelerCount" /><br />
		Trip Type: <select name="tripTypeId">
			<option value="L">Leisure</option>
			<option value="B">Business</option>
			<option value="G">Group</option>
		</select><br />
		Package ID: <input type="number" name="packageId" /><br />
		<button onclick="addBooking(this.form)">Send</button>
	</form>
	<p id="result"></p>
</body>
</html>