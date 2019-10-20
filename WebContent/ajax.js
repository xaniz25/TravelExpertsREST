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

function modifyCustomer(id)
{
   window.location = 'http://localhost:8080/TravelExperts/modifycustomer.jsp?CustomerId=' + id;
}

function getCustomer(id)
{
	$.ajax({ url:"http://localhost:8080/TravelExperts/rs/customer/getcustomer/" + id,
		type:"GET",
		dataType:"json",
		success: function(data){ handleCust(data); }
	});
}

function handleCust(data){
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
	$("#custUserPwd").val(data.custUserPwd)
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
			
		$.ajax({
			url:"http://localhost:8080/TravelExperts/rs/customer/postcustomer",
			data: data,
			type:"POST",
			contentType:"application/json",
			dataType:"text" });
		
		window.location = 'http://localhost:8080/TravelExperts/customers.jsp?reload';
}

function deleteCustomer(id)
{
	$.ajax({url:"http://localhost:8080/TravelExperts/rs/customer/deletecustomer/" + id,type:"DELETE"});
	window.location = 'http://localhost:8080/TravelExperts/customers.jsp?reload';
}

function updateAccount(id, myform)
{
	var data = '{"customerId":' + id
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
		+ '"."custUserPwd":"' + myform.custUserPwd.value + '"}';
		
	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/customer/postcustomer",
		data: data,
		type:"POST",
		contentType:"application/json",
		dataType:"text" });
	
	window.location = 'http://localhost:8080/TravelExperts/accountupdated.jsp';
}

function deleteAccount(id)
{
	$.ajax({url:"http://localhost:8080/TravelExperts/rs/customer/deletecustomer/" + id, type:"DELETE"});
	window.location = 'http://localhost:8080/TravelExperts/accountdeleted.jsp';
}

function bookPackage(pkgid){
	window.location.replace('http://localhost:8080/TravelExperts/checkout.jsp?packageId='+pkgid);
}

function modifyPackage(id)
{
   window.location = 'http://localhost:8080/TravelExperts/modifypackage.jsp?PackageId=' + id;
}

function getPackage(id){
	$.ajax({url: 'http://localhost:8080/TravelExperts/rs/package/getpackage/' + id,
			type: "GET",
			dataType: "json",
			success: function(data){ handlePkg(data); }
	});	
}

function handlePkg(data){
	console.log(JSON.stringify(data));
	$("#packageId").val(data.packageId);
	$("#pkgName").val(data.pkgName);
	$("#pkgDesc").val(data.pkgDesc);
	var start = new Date(data.pkgStartDate);
	$("#pkgStartDate").val(start.getFullYear() + '-' + ('0' + (start.getMonth()+1)).slice(-2) + '-' + ('0' + start.getDate()).slice(-2));
	var end = new Date(data.pkgEndDate);
	$("#pkgEndDate").val(end.getFullYear() + '-' + ('0' + (end.getMonth()+1)).slice(-2) + '-' + ('0' + end.getDate()).slice(-2));
	$("#pkgBasePrice").val(data.pkgBasePrice);
	$("#pkgAgencyCommission").val(data.pkgAgencyCommission);
}

function addPackage(myform)
{
	var data = '{"pkgName":"' + myform.pkgName.value
		+ '","pkgDesc":"' + myform.pkgDesc.value
		+ '","pkgStartDate":"' + myform.pkgStartDate.value
		+ '","pkgEndDate":"' + myform.pkgEndDate.value
		+ '","pkgBasePrice":' + myform.pkgBasePrice.value
		+ ',"pkgAgencyCommission":' + myform.pkgAgencyCommission.value + '}';

	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/package/putpackage",
		data: data,
		type:"PUT",
		contentType:"application/json",
		dataType:"text",
		complete: function(req, stat){ $("#result").html(stat); }
	});
}

function updatePackage(myform){
	var start = new Date(myform.pkgStartDate.value);
	var end = new Date(myform.pkgEndDate.value);
	
	var data = '{"packageId":' + myform.packageId.value
		+ ',"pkgName":"' + myform.pkgName.value
		+ '","pkgDesc":"' + myform.pkgDesc.value
		+ '","pkgStartDate":"' + start.getFullYear() + '-' + ('0' + (start.getMonth()+1)).slice(-2) + '-' + ('0' + start.getDate()).slice(-2)
		+ '","pkgEndDate":"' + end.getFullYear() + '-' + ('0' + (end.getMonth()+1)).slice(-2) + '-' + ('0' + end.getDate()).slice(-2)
		+ '","pkgBasePrice":' + myform.pkgBasePrice.value
		+ ',"pkgAgencyCommission":' + myform.pkgAgencyCommission.value + '}';

	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/package/postpackage",
		data: data,
		type:"POST",
		contentType:"application/json",
		dataType:"text"});
	
	 window.location = 'http://localhost:8080/TravelExperts/packages.jsp?reload'
}

function deletePackage(id){
	$.ajax({url:'http://localhost:8080/TravelExperts/rs/package/deletepackage/' + id, type:"DELETE"});
	window.location = 'http://localhost:8080/TravelExperts/packages.jsp?reload'
}

function modifyBooking(id)
{
   window.location = 'http://localhost:8080/TravelExperts/modifybooking.jsp?BookingId=' + id;
}

function getBooking(id){
	$.ajax({ url:"http://localhost:8080/TravelExperts/rs/booking/getbooking/" + id,
		type:"GET",
		dataType:"json",
		success: function(data){ handleBk(data); }
	});
}

function handleBk(data){
	$("#bookingId").val(data.bookingId);
	var date = new Date(data.bookingDate);
	$("#bookingDate").val(date.getFullYear() + '-' + ('0' + (date.getMonth()+1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2));
	$("#travelerCount").val(data.travelerCount);
	$("#customerId").val(data.customerId);
	$("#tripType").val(data.tripType);
	$("#packageId").val(data.packageId);
}

function addBooking(myform)
{
	var date = new Date();
	
	var data = '{"bookingDate":"' + date.getFullYear() + '-' + ('0' + (date.getMonth()+1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2)
		+ '","travelerCount":' + myform.travelerCount.value
		+ ',"customerId":' + myform.customerId.value
		+ ',"tripType":"' + myform.tripType.value
		+ '","packageId":' + myform.packageId.value + '}';

	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/booking/putbooking",
		data: data,
		type:"PUT",
		contentType:"application/json",
		dataType:"text"
	});
}

function updateBooking(myform){
	var date = new Date(myform.bookingDate.value);
	
	var data = '{"bookingId":' + myform.bookingId.value
		+ ',"bookingDate":' + date.getFullYear() + '-' + ('0' + (date.getMonth()+1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2)
		+ ',"travelerCount":' + myform.travelerCount.value
		+ ',"customerId":' + myform.customerId.value
		+ ',"tripType":"' + myform.tripType.value
		+ '","packageId":' + myform.packageId.value + '}';

	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/booking/postbooking",
		data: data,
		type:"POST",
		contentType:"application/json",
		dataType:"text"
	});
	
	window.location = 'http://localhost:8080/TravelExperts/bookings.jsp?reload'
}

function deleteBooking(id){
	$.ajax({ url:"http://localhost:8080/TravelExperts/rs/booking/deletebooking/" + id, type:"DELETE" });
	window.location = 'http://localhost:8080/TravelExperts/bookings.jsp?reload';
}

function checkout(myform, custid, pkgid)
{
	var date = new Date();
	
	var data = '{"bookingDate":"' + date.getFullYear() + '-' + ('0' + (date.getMonth()+1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2)
		+ '","travelerCount":' + myform.travelerCount.value
		+ ',"customerId":' + custid
		+ ',"tripType":"' + myform.tripType.value
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
				option.text = prov.provName;
				option.value = prov.provCode;
				provSelect.add(option); 
			}
		}
	};
	req.open("GET", "http://localhost:8080/TravelExperts/rs/province/getprovincesfromcountry/" + country);
	req.send();
}

function clearSelect(selectObject){
	while (selectObject.options.length > 0) {                
        selectObject.remove(0);
    }   
}

