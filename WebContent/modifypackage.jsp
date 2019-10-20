<%@ include file="head.jsp" %>
  <title>Agents - Modify Package</title>
</head>
<body onload="getPackage(<%=request.getParameter("PackageId")%>)">
<%@ include file="nav.jsp"%>
	<div class="contain">
   		<div id="formbg">
			<form action="packages.jsp?reload">
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
		</div>
	</div>
</body>
</html>