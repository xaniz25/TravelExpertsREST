<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Agents - Modify Package</title>
<script src="jquery.js"></script>
<script>
function getPackage(id, myform){
	var data = '{"packageId":' + myform.packageId.value
		+ ',"pkgName":"' + myform.pkgName.value
		+ '","pkgDesc":"' + myform.pkgDesc.value
		+ '","pkgStartDate":"' + myform.pkgStartDate.value
		+ '","pkgEndDate":"' + myform.pkgEndDate.value
		+ '","pkgBasePrice":' + myform.pkgBasePrice.value
		+ ',"pkgAgencyCommission":' + myform.pkgAgencyCommission.value + '}';
		
		console.log("data:" + data);

	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/package/getpackage/" + id,
		data: data,
		type:"GET",
		contentType:"application/json",
		dataType:"text",
		complete: function(req, stat){ $("#result").html(stat); }
	});
}

function updatePackage(myform){
	var data = '{"packageId":' + myform.pkgName.value
		+ ',"pkgName":"' + myform.pkgName.value
		+ '","pkgDesc":"' + myform.pkgDesc.value
		+ '","pkgStartDate":"' + myform.pkgStartDate.value
		+ '","pkgEndDate":"' + myform.pkgEndDate.value
		+ '","pkgBasePrice":' + myform.pkgBasePrice.value
		+ ',"pkgAgencyCommission":' + myform.pkgAgencyCommission.value + '}';
		
		console.log("data:" + data);

	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/package/postpackage",
		data: data,
		type:"POST",
		contentType:"application/json",
		dataType:"text",
		complete: function(req, stat){ $("#result").html(stat); }
	});
}

function deletePackage(id){
	$.ajax({
		url:"http://localhost:8080/TravelExperts/rs/package/deletepackage" + id
	});
}
</script>
</head>
<body>
<h1><%=request.getParameter("PackageId")%></h1>
	<form onload="getPackage(<%=request.getParameter("PackageId")%>, this.form)">
		Package ID: <input type="text" name="packageId" id="packageId" /><br />
		Package Name: <input type="text" name="pkgName" /><br />
		Description: Postal: <input type="text" name="pkgDesc" /><br />
		Start Date: <input type="date" name="pkgStartDate" /><br />
		End Date: <input type="date" name="pkgEndDate" /><br />
		Base Price($): <input type="number" name="pkgBasePrice" /><br />
		Commission($): <input type="number" name="pkgAgencyCommission" /><br />
		<button onclick="updatePackage(this.form)">Edit</button>
		<button onclick="deletePackage(<%=request.getParameter("PackageId")%>)">Delete</button>
	</form>
</body>
</html>