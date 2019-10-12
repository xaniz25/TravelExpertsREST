<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Agents - Modify Package</title>
<script src="jquery.js"></script>
<script>
function getPackage(id){
	$.ajax({url: 'http://localhost:8080/TravelExperts/rs/package/getpackage/' + id,
			type: "GET",
			dataType: "json",
			success: function(data){ handle(data); }
	});	
}

function handle(data){
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
	
	 window.location = 'http://localhost:8080/TravelExperts/packages.jsp'
}

function deletePackage(id){
	$.ajax({url:'http://localhost:8080/TravelExperts/rs/package/deletepackage/' + id, type:"DELETE"});
	window.location = 'http://localhost:8080/TravelExperts/packages.jsp'
}
</script>
</head>
<body onload="getPackage(<%=request.getParameter("PackageId")%>)">
	<form>
		Package ID: <input type="text" name="packageId" id="packageId" /><br />
		Package Name: <input type="text" name="pkgName" id="pkgName"/><br />
		Description: <input type="text" name="pkgDesc" id="pkgDesc" /><br />
		Start Date: <input type="date" name="pkgStartDate" id="pkgStartDate"/><br />
		End Date: <input type="date" name="pkgEndDate" id="pkgEndDate"/><br />
		Base Price($): <input type="number" name="pkgBasePrice" id="pkgBasePrice"/><br />
		Commission($): <input type="number" name="pkgAgencyCommission" id="pkgAgencyCommission"/><br />
		<button onclick="updatePackage(this.form)">Edit</button>
		<button onclick="deletePackage(<%=request.getParameter("PackageId")%>)">Delete</button>
	</form>
</body>
</html>