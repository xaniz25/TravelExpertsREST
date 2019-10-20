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
			<a href="bookpackage.jsp"><button>Make new booking</button></a></br>
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
		             <th>Traveler Count</th>
		             <th>Trip Type</th>
		             <th>Package</th>
		             <th>Package</th>
		             <th>Description</th>
		             <th>Price</th>
		          </tr>
		      </thead>
		      <tbody>
		        <% while(rs.next()){ %>
		            <tr>
		                <td><%=rs.getInt("BookingId") %></td>
		                <td><%=rs.getDate("BookingDate") %></td>
		                <td><%=rs.getInt("TravelerCount") %></td>
		                <td><%=rs.getString("TripType") %></td>
		                <td><%=rs.getString("PkgName") %></td>
		                <td><%=rs.getString("PkgDesc") %></td>
		                <td><%=rs.getDouble("PkgBasePrice") %></td>
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