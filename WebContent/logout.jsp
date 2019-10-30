<%-- Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers--%>

<%-- Stops the session then redirect to home page --%>
<%@ include file="head.jsp"%>
<title>Travel Experts - Logged Out</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<%
session.invalidate();
response.sendRedirect("http://localhost:8080/TravelExperts/index.jsp");
%>
<h1>You have been logout</h1>
</body>
</html>