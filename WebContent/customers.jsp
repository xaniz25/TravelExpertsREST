<%@ include file="head.jsp"%>
<title>Travel Experts Agents- Customers</title>
</head>
<body>
<%@ include file="nav.jsp"%>
	<div class="contain">
		<div id="agttables">
			</br>
			<h1>Customers</h1>
			</br>
<% if(session.getAttribute("agentId")==null){
out.print("<h1>Please login</h1>");
response.sendRedirect("agentlogin.jsp");
}else{
	try{
	    Class.forName("org.mariadb.jdbc.Driver");
	    Connection con = (Connection) DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts","root","");
	    Statement st = con.createStatement();
	    ResultSet rs = st.executeQuery("select * from Customers;");
%>
	<a href="agentwelcome.jsp"><button>Home</button></a>

	<table>
      <thead>
          <tr>
             <th>CustomerID</th>
             <th>First Name</th>
             <th>Last Name</th>
             <th>Address</th>
             <th>City</th>
             <th>Province</th>
             <th>Postal Code</th>
             <th>Country</th>
             <th>Phone</th>
             <th>Email</th>
             <th>UserID</th>
          </tr>
      </thead>
      <tbody>
        <% while(rs.next()){ %>
            <tr>
                <td><%=rs.getInt("CustomerId") %></td>
                <td><%=rs.getString("CustFirstName") %></td>
                <td><%=rs.getString("CustLastName") %></td>
                <td><%=rs.getString("CustAddress") %></td>
                <td><%=rs.getString("CustCity") %></td>
                <td><%=rs.getString("CustProv") %></td>
                <td><%=rs.getString("CustPostal") %></td>
                <td><%=rs.getString("CustCountry") %></td>
                <td><%=rs.getString("CustPhone") %></td>
                <td><%=rs.getString("CustEmail") %></td>
                <td><%=rs.getString("CustUserID") %></td>
                <td><button id="<%=rs.getInt("CustomerId") %>" onClick="modifyCustomer(this.id)">Modify</button>
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