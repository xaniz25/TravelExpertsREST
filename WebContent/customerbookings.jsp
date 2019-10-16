<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel Experts - Packages</title>
</head>
<body>
<a href="bookpackage.jsp"><button>Make new booking</button></a>
<%
    try
    {
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
                <td><%=rs.getString("TripTypeId") %></td>
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
    %>
</body>
</html>