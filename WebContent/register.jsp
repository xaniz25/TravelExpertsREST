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
		
	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/customer/putcustomer",
		data: data,
		type:"PUT",
		contentType:"application/json",
		dataType:"text"
	});
}

function loadprovinces(country){
	var req = new XMLHttpRequest();
	req.onreadystatechange = function(){
		if (req.readyState == 4 && req.status == 200){
			var provArray = JSON.parse(req.responseText);
			var provSelect = document.getElementById("custProv");
			clearSelect(provSelect); //clear dropdown before loading
			for (i=0; i<provArray.length; i++){
				var prov = provArray[i];
				var option = document.createElement("option");
				option.text = prov.provinceName;
				option.value = prov.provinceCode;
				provSelect.add(option); 
			}
		}
	};
	req.open("GET", "http://localhost:8080/TravelExperts/rs/province/getprovincesfromcountry/" + country);
	req.send();
}

//clears the dropdown
function clearSelect(selectObject){
	while (selectObject.options.length > 0) {                
        selectObject.remove(0);
    }   
}
</script>
</head>
<body>
	<form action="registerthankyou.jsp">
		First Name: <input type="text" name="custFirstName" /><br />
		Last Name: <input type="text" name="custLastName" /><br />
		Address: <input type="text" name="custAddress" /><br />
		City: <input type="text" name="custCity" /><br />
		Province: <select name="custProv" id="custProv">
		<option value=''>Select One...</option>
		</select><br />
		Postal: <input type="text" name="custPostal" /><br />
		Country: <select name="custCountry" onchange="loadprovinces(this.value)">
			<option value=''>Select One...</option>
			<option value='Canada'>Canada</option>
			<option value='United States'>United States</option>
			</select><br />
		Phone: <input type="text" name="custPhone" /><br />
		Email: <input type="text" name="custEmail" /><br />
		User ID: <input type="text" name="custUserID" /><br />
		Password: <input type="password" name="custUserPwd" /><br />
		Confirm Password: <input type="password" /><br />
		<button onclick="addCustomer(this.form)">Register</button>
	</form>
</body>
</html>