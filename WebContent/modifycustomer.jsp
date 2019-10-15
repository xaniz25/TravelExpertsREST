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
	$.ajax({ url:"http://localhost:8080/TravelExperts/rs/customer/getcustomer/" + id,
		type:"GET",
		dataType:"json",
		success: function(data){ handle(data); }
	});
}

function handle(data){
	console.log(data);
	console.log(JSON.stringify(data));
	$("#customerId").val(data.customerId);
	$("#custFirstName").val(data.custFirstName);
	$("#custLastName").val(data.custLastName);
	$("#custAddress").val(data.custAddress);
	$("#custCity").val(data.custCity);
	$("#custProv").val(data.custProv);
	$("#custPostal").val(data.custPostal);
	$("#custCountry").val(data.custCountry);
	$("#custPhone").val(data.custPhone);
	$("#custEmail").val(data.custEmail);
	$("#custUserID").val(data.custUserID);
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
			+ '","custUserID":"' + myform.custUserID.value + '"}';

			console.log(data);
			
		$.ajax({
			url:"http://localhost:8080/TravelExperts/rs/customer/postcustomer",
			data: data,
			type:"POST",
			contentType:"application/json",
			dataType:"text" });
		
		window.location = 'http://localhost:8080/TravelExperts/customers.jsp';
}

function deleteCustomer(id)
{
	$.ajax({url:"http://localhost:8080/TravelExperts/rs/customer/deletecustomer/" + id,type:"DELETE"});
	window.location = 'http://localhost:8080/TravelExperts/customers.jsp';
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
<body onload="getCustomer(<%=request.getParameter("CustomerId")%>)">
	<form action="customers.jsp">
		Customer ID: <input type="number" name="customerId" id="customerId"/><br />
		First Name: <input type="text" name="custFirstName" id="custFirstName" /><br />
		Last Name: <input type="text" name="custLastName" id="custLastName"/><br />
		Address: <input type="text" name="custAddress" id="custAddress" /><br />
		City: <input type="text" name="custCity" id="custCity"/><br />
		Province: <select name="custProv" id="custProv">
		<option value=''>Select One...</option>
		</select><br />
		Postal: <input type="text" name="custPostal" id="custPostal" /><br />
		Country: <select name="custCountry" id="custCountry" onchange="loadprovinces(this.value)">
			<option value=''>Select One...</option>
			<option value='Canada'>Canada</option>
			<option value='United States'>United States</option>
			</select><br />
		Phone: <input type="text" name="custPhone" id="custPhone" /><br />
		Email: <input type="text" name="custEmail" id="custEmail" /><br />
		User ID: <input type="text" name="custUserID" id= "custUserID" /><br />
		<button onclick="updateCustomer(this.form)">Edit</button>
		<button onclick="deleteCustomer(<%=request.getParameter("CustomerId")%>)">Delete</button>
	</form>
</body>
</html>