<%@ include file="head.jsp" %>
  <title>Travel Experts Agents- Add Package</title>
</head>
<body>
<%@ include file="nav.jsp"%>
	<div class="contain">
   		<div id="formbg">
			<form action="packages.jsp">
				Package Name: <input type="text" name="pkgName" /><br />
				Description: Postal: <input type="text" name="pkgDesc" /><br />
				Start Date: <input type="date" name="pkgStartDate" /><br />
				End Date: <input type="date" name="pkgEndDate" /><br />
				Base Price($): <input type="number" name="pkgBasePrice" /><br />
				Commission($): <input type="number" name="pkgAgencyCommission" /><br />
				<button onclick="addPackage(this.form)">Add</button>
			</form>
		</div>
	</div>
</body>
</html>