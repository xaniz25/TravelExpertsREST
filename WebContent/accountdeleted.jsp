<%-- Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers--%>

<%@ include file="head.jsp" %>
  <!-- Redirects to home page after 3 seconds -->
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