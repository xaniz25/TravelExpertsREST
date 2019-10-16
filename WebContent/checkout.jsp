<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Add Booking</title>
<script src="jquery.js"></script>
<script>
function addBooking(myform, custid, pkgid)
{
	var date = new Date();
	
	var data = '{"bookingDate":"' + date.getFullYear() + '-' + ('0' + (date.getMonth()+1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2)
		+ '","travelerCount":' + myform.travelerCount.value
		+ ',"customerId":' + custid
		+ ',"tripTypeId":"' + myform.tripTypeId.value
		+ '","packageId":' + pkgid + '}';

		console.log(data);
		
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
<body>
<% if(session.getAttribute("customerId")==null){
out.print("<h1>Please login</h1>");
response.sendRedirect("customerlogin.jsp");
}else{
%>
<h1><%=session.getAttribute("customerId")%></h1><%=request.getParameter("packageId")%>
	<form action="bookingthankyou.jsp">
		Traveler Count: <input type="number" name="travelerCount" /><br />
		Trip Type: <select name="tripTypeId">
			<option value="L">Leisure</option>
			<option value="B">Business</option>
			<option value="G">Group</option>
		</select><br />
		<button onclick="addBooking(this.form, <%=session.getAttribute("customerId")%>, <%=request.getParameter("packageId")%>)">Add</button>
	</form>
<% } %> <%--else--%>
</body>
</html>