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
<script>
function modifyBooking(id)
{
   window.location = 'http://localhost:8080/TravelExperts/modifybooking.jsp?BookingId=' + id;
}
</script>
</head>
<body>
<h1>Our Packages</h1>
<%
    try
    {
        Class.forName("org.mariadb.jdbc.Driver");
        Connection con = (Connection) DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts","root","");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from Bookings;");
%>
	<table>
      <thead>
          <tr>
             <th>Booking ID</th>
             <th>Booking No</th>
             <th>Booking Date</th>
             <th>Customer ID</th>
             <th>Traveler Count</th>
             <th>Trip Type</th>
             <th>Package Id</th>
          </tr>
      </thead>
      <tbody>
        <% while(rs.next()){ %>
            <tr>
                <td><%=rs.getInt("BookingId") %></td>
                <td><%=rs.getString("BookingNo") %></td>
                <td><%=rs.getDate("BookingDate") %></td>
                <td><%=rs.getInt("CustomerId") %></td>
                <td><%=rs.getInt("TravelerCount") %></td>
                <td><%=rs.getString("TripType") %></td>
                <td><%=rs.getInt("PackageId") %></td>
                <td><button id="<%=rs.getInt("BookingId") %>" onClick="modifyBooking(this.id)">Modify</button>
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