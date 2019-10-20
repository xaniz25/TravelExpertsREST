<%@ include file="head.jsp"%>
<title>Travel Experts - Thank you for Booking</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<% if(session.getAttribute("customerId")==null){
out.print("<h1>Please login</h1>");
response.sendRedirect("customerlogin.jsp");
}else{
%>
<h1><%=session.getAttribute("customerId")%></h1><%=request.getParameter("packageId")%>
	<div class="contain">
		<div id="formbg">
			<form action="bookingthankyou.jsp">
				Traveler Count: <input type="number" name="travelerCount" /><br />
				Trip Type: <select name="tripType">
					<option value="Leisure">Leisure</option>
					<option value="Business">Business</option>
					<option value="Group">Group</option>
				</select><br />
				<button onclick="checkout(this.form, <%=session.getAttribute("customerId")%>, <%=request.getParameter("packageId")%>)">Add</button>
			</form>
<% } %> <%--else--%>
		</div>
	</div>
</body>
</html>