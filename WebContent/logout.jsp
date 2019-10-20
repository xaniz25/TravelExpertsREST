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