<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Add Package</title>
<script src="jquery.js"></script>
<script>
	function addPackage(myform)
	{
		var data = '{"pkgName":"' + myform.pkgName.value
			+ '","pkgDesc":"' + myform.pkgDesc.value
			+ '","pkgStartDate":"' + myform.pkgStartDate.value
			+ '","pkgEndDate":"' + myform.pkgEndDate.value
			+ '","pkgBasePrice":' + myform.pkgBasePrice.value
			+ ',"pkgAgencyCommission":' + myform.pkgAgencyCommission.value + '}';
			
			console.log("data:" + data);

		$.ajax({
			url:"http://localhost:8080/TravelExperts/rs/package/putpackage",
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
		Package Name: <input type="text" name="pkgName" /><br />
		Description: Postal: <input type="text" name="pkgDesc" /><br />
		Start Date: <input type="date" name="pkgStartDate" /><br />
		End Date: <input type="date" name="pkgEndDate" /><br />
		Base Price($): <input type="number" name="pkgBasePrice" /><br />
		Commission($): <input type="number" name="pkgAgencyCommission" /><br />
		<button onclick="addPackage(this.form)">Send</button>
	</form>
</body>
</html>