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
			<form action="bookingthankyou.jsp" onSubmit="checkout(this, <%=session.getAttribute("customerId")%>, <%=request.getParameter("packageId")%>)">
				<p id="registerError" style="font-size: 18px; visibility: hidden; color: red">Please complete form and check format!</p>
				<p>Booking Information</p>
				<table>
				<tr><td>Traveler Count:</td>
					<td><input type="number" name="travelerCount" id="travelerCount" /></td>
				</tr>
				<tr><td>Trip Type:</td>
					<td><select name="tripType" id="tripType">
						<option value="Leisure">Leisure</option>
						<option value="Business">Business</option>
						<option value="Group">Group</option>
					</select></td>
				</tr>
				</table>
				<p>Payment Information</p>
				<table>
				<tr><td>Card Type</td>
					<td><select>
							<option>Visa</option>
							<option>Master Card</option>
							<option>AMEX</option>
						</select></td>
				</tr>
				<tr><td>Card Number</td>
					<td><input type="number" size="20"/></td>
				</tr>
				<tr><td>Expiry</td>
					<td><input type="text" size="10"/></td>
				</tr>
				<tr><td>CCV</td>
					<td><input type="number" size="5"/></td>
				</tr>
				</table>
				<button onClick="return validateCheckout()" value="submit">Add</button>
			</form>
<% } %> <%--else--%>
		</div>
	</div>
</body>
</html>