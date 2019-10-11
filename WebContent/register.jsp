<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Register Customer</title>
<script src="jquery.js"></script>
<script>
	function addCustomer(myform)
	{
		var data = '{"custAddress":"' + myform.custAddress.value
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
			url:"http://localhost:8080/TravelExperts/rs/customer/putcustomer",
			data: data,
			type:"PUT",
			contentType:"application/json",
			dataType:"text",
			complete: function(req, stat){ $("#result").html(stat); }
		});
	}
</script>
</head>
<body>
	<form>
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
		Password: <input type="password" name="custUserPwd" /><br />
		Confirm Password: <input type=password" /><br />
		<button onclick="addCustomer(this.form)">Send</button>
	</form>
</body>
</html>