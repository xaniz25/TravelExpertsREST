<%@ include file="head.jsp" %>
  <title>Agents - Modify Package</title>
</head>
<body onload="getPackage(<%=request.getParameter("PackageId")%>)">
<%@ include file="nav.jsp"%>
	<div class="contain">
   		<div id="formbg">
			<form action="packages.jsp?reload" onSubmit="updatePackage(this)">
			<p id="registerError" style="font-size: 18px; visibility: hidden; color: red">Please complete form and check format!</p>
				<table>
					<tr><td>Package ID:</td>
						<td><input type="text" name="packageId" id="packageId" /></td>
					</tr>
					<tr><td>Package Name:</td>
						<td><input type="text" name="pkgName" id="pkgName"/></td>
					</tr>
					<tr><td>Description:</td>
						<td><input type="text" name="pkgDesc" id="pkgDesc" /></td>
					</tr>
					<tr><td>Start Date:</td>
						<td><input type="date" name="pkgStartDate" id="pkgStartDate"/></td>
					</tr>
					<tr><td>End Date:</td>
						<td><input type="date" name="pkgEndDate" id="pkgEndDate"/></td>
					</tr>
					<tr><td>Base Price($):</td>
						<td><input type="number" name="pkgBasePrice" id="pkgBasePrice"/></td>
					</tr>
					<tr><td>Commission($):</td>
						<td><input type="number" name="pkgAgencyCommission" id="pkgAgencyCommission"/></td>
					</tr>
				</table>
				<button onclick="return validateModifyPkg()">Edit</button>
				<button onclick="deletePackage(<%=request.getParameter("PackageId")%>)">Delete</button>
			</form>
		</div>
	</div>
</body>
</html>