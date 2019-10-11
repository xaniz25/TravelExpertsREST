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
function modifyCustomer(id)
{
   window.location = 'http://localhost:8080/TravelExperts/modifycustomer.jsp?CustomerId=' + id;
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
        ResultSet rs = st.executeQuery("select * from Customers;");
%>
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
    %>
</body>
</html>