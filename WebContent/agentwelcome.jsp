<%-- Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers--%>

<%@ include file="head.jsp"%>
<title>Travel Experts - Agent Dashboard</title>
</head>
<body>
<%@ include file="nav.jsp"%>

<%-- if already logged in, continue to welcome page --%>
<% if(session.getAttribute("agentId")==null){
out.print("<h1>Please login</h1>");
response.sendRedirect("agentlogin.jsp");
}else{
%>
	<div class="contain">
		<div id="entry">
			<h1>Welcome, <%=session.getAttribute("agtFirstName") %>!</h1>
			<a href="bookings.jsp"><button>Bookings</button></a>
			<a href="packages.jsp"><button>Packages</button></a>
			<a href="customers.jsp"><button>Customers</button></a></br>
			<a href="logout.jsp"><button>Logout</button></a>
	<% } %> <%--else--%>
		</div>
	</div>
</body>
</html>