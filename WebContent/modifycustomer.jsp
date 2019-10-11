<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<title>Travel Experts - Modify Customer</title>
<script src="jquery.js"></script>
<script>
function getCustomer(id, myform)
{
	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/customer/getcustomer/" + id,
		data: data,
		type:"GET",
		contentType:"application/json",
		dataType:"text",
		complete: function(req, stat){ $("#result").html(stat); }
	});
	
	var data = '{"customerId":' + myform.customerId.value
		+ ',"custAddress":"' + myform.custAddress.value
		+ '","custPhone":"' + myform.custPhone.value
		+ '","custCity":"' + myform.custCity.value
		+ '","custCountry":"' + myform.custCountry.value
		+ '","custEmail":"' + myform.custEmail.value
		+ '","custFirstName":"' + myform.custFirstName.value
		+ '","custLastName":"' + myform.custLastName.value
		+ '","custPostal":"' + myform.custPostal.value
		+ '","custProv":"' + myform.custProv.value
		+ '","custUserID":"' + myform.custUserID.value
		+ '","custUserPwd":"' + myform.custUserPwd.value + '"}';

		console.log("data:" + data);
}

function updateCustomer(myform)
	{
		var data = '{"customerId":' + myform.customerId.value
			+ ',"custAddress":"' + myform.custAddress.value
			+ '","custPhone":"' + myform.custPhone.value
			+ '","custCity":"' + myform.custCity.value
			+ '","custCountry":"' + myform.custCountry.value
			+ '","custEmail":"' + myform.custEmail.value
			+ '","custFirstName":"' + myform.custFirstName.value
			+ '","custLastName":"' + myform.custLastName.value
			+ '","custPostal":"' + myform.custPostal.value
			+ '","custProv":"' + myform.custProv.value
			+ '","custUserID":"' + myform.custUserID.value
			+ '","custUserPwd":"' + myform.custUserPwd.value + '"}';
			
			console.log("data:" + data);

		$.ajax({
			url:"http://localhost:8080/TravelExperts/rs/customer/postcustomer",
			data: data,
			type:"POST",
			contentType:"application/json",
			dataType:"text",
			complete: function(req, stat){ $("#result").html(stat); }
		});
}

function deleteCustomer(id)
{
	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/customer/deletecustomer/" + id,
		data: '{"customerId":'+id+'}',
		type:"DELETE",
		contentType:"application/json",
		dataType:"text",
		complete: function(req, stat){ $("#result").html(stat); }
	});
}
</script>
</head>
<body>
<% int id = Integer.parseInt(request.getParameter("CustomerId")); %>
	<form onload="getcustomer(<%=id%>, this)">
		Customer ID: <input type="number" name="customerId" id="customerId"/><br />
		First Name: <input type="text" name="custFirstName" /><br />
		Last Name: <input type="text" name="custLastName" /><br />
		Address: <input type="text" name="custAddress" /><br />
		City: <input type="text" name="custCity" /><br />
		Province: <input type="text" name="custProv" /><br />
		Postal: <input type="text" name="custPostal" /><br />
		Country: <input type="text" name="custCountry" /><br />
		Phone: <input type="text" name="custPhone" /><br />
		Email: <input type="text" name="custEmail" /><br />
		User ID: <input type="text" name="custUserID" /><br />
		Password: <input type="text" name="custUserPwd" /><br />
		<button onclick="updateCustomer(this.form)">Edit</button>
		<button onclick="deleteCustomer(<%=id%>)">Delete</button>
	</form>
</body>
</html>