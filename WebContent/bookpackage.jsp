<%@ include file="head.jsp" %>
  <title>Travel Experts - Packages</title>
</head>
<body>
<%@ include file="nav.jsp" %>
<div class="contain">
    <div id="bookpackage">
		<h1>Our Packages</h1>
			<ul>
<% try {
        Class.forName("org.mariadb.jdbc.Driver");
        Connection con = (Connection) DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts","root","");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from Packages;");
		while(rs.next()){ %>
			<li class="eachpackage">
				<img src ="images/<%=rs.getString("PkgImg")%>" >
				<table>
                	<tr><td><h3><%=rs.getString("PkgName") %></h3></td></tr>
                	<tr><td><%=rs.getString("PkgDesc") %></td></tr>
                	<tr><td>From: <%=rs.getDate("PkgStartDate") %></td></tr>
                	<tr><td>To: <%=rs.getDate("PkgEndDate") %></td></tr>
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
</body>
</html>