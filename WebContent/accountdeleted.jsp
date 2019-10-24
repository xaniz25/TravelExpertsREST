<%@ include file="head.jsp" %>
  <meta http-equiv="Refresh" content="3;url=http://localhost:8080/TravelExperts/index.jsp">
  <title>Travel Experts - Home</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<%
session.invalidate();
%>
	<div class="contain">
		<div id="message">
			<h3>Your account has been deleted.</h3>
		</div>
	</div>
</body>
</html>