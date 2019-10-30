<%-- Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers--%>

<%@ include file="head.jsp" %>
  <title>Travel Experts Agents- Add Package</title>
</head>
<body>
<%@ include file="nav.jsp"%>
	<div class="contain">
   		<div id="formbg">
			<form action="packages.jsp?reload" onsubmit="addPackage(this)">
			<p id="registerError" style="font-size: 18px; visibility: hidden; color: red">Please complete form and check format!</p>
				<table>
					<tr><td>Package Name:</td>
						<td><input type="text" name="pkgName" id="pkgName" /></td>
					</tr>
					<tr><td>Description:</td>
						<td><input type="text" name="pkgDesc" id="pkgDesc" /></td>
					</tr>
					<tr><td>Start Date:</td>
						<td><input type="date" name="pkgStartDate" id="pkgStartDate" /></td>
					</tr>
					<tr><td>End Date:</td>
						<td><input type="date" name="pkgEndDate" id="pkgEndDate" /></td>
					</tr>
					<tr><td>Base Price($):</td>
						<td><input type="number" name="pkgBasePrice" id="pkgBasePrice" /></td>
					</tr>
					<tr><td>Commission($):</td>
						<td><input type="number" name="pkgAgencyCommission" id="pkgAgencyCommission" /></td>
					</tr>
				</table>
				<button onclick="return validateAddPkg()">Add</button>
			</form>
		</div>
	</div>
</body>
</html>