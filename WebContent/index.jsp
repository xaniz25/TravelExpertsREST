<%-- Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers--%> 
<%@ include file="head.jsp" %>
  <title>Travel Experts - Home</title>
</head>
<body>
<%@ include file="nav.jsp"%>
	<div class="contain">
		<div id="home" class="animated fadeIn slow">
			<h1>Let us take you to a</br>new adventure</h1>
			<a href="#packages"><button id="book" class="animated fadeInUpBig slow">View Our Packages</button></a>
		</div>
	</div>
	<div class="contain-pkg">
		<div id="packages">
			<h1>Our Top Packages</h1>
				<ul>
		<% try {
	        Class.forName("org.mariadb.jdbc.Driver");
	        Connection con = (Connection) DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts","root","");
	        Statement st = con.createStatement();
	      //displaying only top 4 packages
	        ResultSet rs = st.executeQuery("select * from Packages limit 4;");
			while(rs.next()){ %>
				<li class="eachpackage">
					<img src ="images/<%=rs.getString("PkgImg")%>" >
					<table>
	                	<tr><td><h6><%=rs.getString("PkgName") %></h6></td></tr>
	                	<tr><td><%=rs.getString("PkgDesc") %></td></tr>
	                	<tr><td><%=rs.getDate("PkgStartDate") %> to <%=rs.getDate("PkgEndDate") %></td></tr>
	                	<tr><td>Price: $<%=rs.getDouble("PkgBasePrice") %></td></tr>
	               		<tr><td><button id="<%=rs.getInt("PackageId") %>" onClick="bookPackage(this.id)">Book this Package</button></td></tr>
	    			</table>
		    <%}
		    st.close();
		    con.close();
		    }
		    catch(Exception e){
		        out.print(e.getMessage());%><br><%
		    }
		    %>
	   				</li>
	    		</ul>
	   		</div>
	   	</div>
<%@ include file="foot.jsp" %>
