<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Packages</title>
</head>
<body>
<%
    try
    {
        Class.forName("org.mariadb.jdbc.Driver");
        Connection con=(Connection) DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from Packages;");
%>
	<table>
      <thead>
          <tr>
             <th>Package ID</th>
             <th>Package Name</th>
             <th>Description</th>
             <th>Start Date</th>
             <th>End Date</th>
             <th>Base Price</th>
             <th>Commission</th>
          </tr>
      </thead>
      <tbody>
        <% while(rs.next()){ %>
            <tr>
                <td><%=rs.getInt("PackageId") %></td>
                <td><%=rs.getString("PkgName") %></td>
                <td><%=rs.getString("PkgDesc") %></td>
                <td><%=rs.getString("PkgStartDate") %></td>
                <td><%=rs.getString("PkgEndDate") %></td>
                <td><%=rs.getDouble("PkgBasePrice") %></td>
                <td><%=rs.getDouble("PkgAgencyCommission") %></td>
                <td><button id=<%=rs.getInt("PackageId") %> onClick="book(this.id)">Book Now</button>
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
    %>
</body>
</html>