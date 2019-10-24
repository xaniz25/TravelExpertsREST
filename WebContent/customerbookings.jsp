<%@ include file="head.jsp"%>
<title>Travel Experts - Packages</title>
</head>
<body>
<% if(session.getAttribute("customerId")==null){
out.print("<h1>Please login</h1>");
response.sendRedirect("customerlogin.jsp");
}else{ %>
<%@ include file="nav.jsp"%>
	<div class="contain">
		<div id="agttables">
			<a href="index.jsp#packages"><button>Make new booking</button></a></br>
			<% try {
			        Class.forName("org.mariadb.jdbc.Driver");
			        Connection con = (Connection) DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts","root","");
			        Statement st = con.createStatement();
			        PreparedStatement preparedStatement = con.prepareStatement("select * from Bookings b inner join Packages p on b.packageId = p.packageId where customerId=?");
			        preparedStatement.setInt(1, (int)session.getAttribute("customerId"));
			        ResultSet rs = preparedStatement.executeQuery();
			%>
			<table>
		      <thead>
		          <tr>
		             <th>Booking ID</th>
		             <th>Booking Date</th>
		             <th>Package</th>
		             <th>Price</th>
		             <th>Traveler Count</th>
		             <th>Trip Type</th>
		             <th>Trip Start</th>
             		 <th>Trip End</th>
		          </tr>
		      </thead>
		      <tbody>
		        <% while(rs.next()){ %>
		            <tr>
		                <td><%=rs.getInt("BookingId") %></td>
		                <td><%=rs.getDate("BookingDate") %></td>
		                <td><%=rs.getString("PkgName") %></td>
		                <td><%=rs.getDouble("PkgBasePrice") %></td>
		                <td><%=rs.getInt("TravelerCount") %></td>
		                <td><%=rs.getString("TripType") %></td>
		                <td><%=rs.getDate("TripStart") %></td>
               			<td><%=rs.getDate("TripEnd") %></td>
		            </tr>
		         <%}%>
		           </tbody>
		        </table><br>
		    <%
		    st.close();
		    con.close();
		    }
		    catch(Exception e){
		        out.print(e.getMessage());%><br><%
		    }
		}
	    %>
	    </div>
	</div>
</body>
</html>