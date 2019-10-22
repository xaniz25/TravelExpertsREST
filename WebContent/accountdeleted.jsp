<%@ include file="head.jsp" %>
  <title>Travel Experts - Home</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<%
session.invalidate();
response.sendRedirect("http://localhost:8080/TravelExperts/index.jsp");
%>
	<div class="contain">
		<div id="message">
			<h3>Your account has been deleted.</h3>
		</div>
	</div>
</body>
</html>