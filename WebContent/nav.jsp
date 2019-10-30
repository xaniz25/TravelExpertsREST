<!--Shanice Talan October 2019
Navigation bar and buttons-->

<header>
 <!--Logo and Title-->
 <a href="index.jsp"><img src="images/logo2.png"/></a>

 <div id=loginbar>
   <a href="logout.jsp">Logout</a>
   <a href="agentlogin.jsp">
     <%
     if(session.getAttribute("agtFirstName")!=null)
    	 out.println("Welcome, " + session.getAttribute("agtFirstName"));
     else
    	 out.println("Agent Login");
      %>
    </a>

   <a href="customerlogin.jsp">
     <%
     if(session.getAttribute("custFirstName")!=null)
        out.println("Welcome, " + session.getAttribute("custFirstName"));
     else
        out.println("Customer Login");
      %>
   </a>
 </div>

 <!--Nav bar for bigger screens-->
 <ul class ="nav">
   <li><a href="index.jsp">Home</a></li>
   <li><a href="bookpackage.jsp">Packages</a></li>
   <li><a href="register.jsp">Register</a></li>
 </ul>

 <!--Nav bar for smaller screens-->
 <div id="navdrop">
   <button id="navbtn">Menu</button>
   <ul class ="nav2">
     <li><a href="index.jsp">Home</a></li>
     <li><a href="bookpackage.jsp">Packages</a></li>
     <li><a href="register.jsp">Register</a></li>
     <li><a href="customerlogin.jsp">Customer</a></li>
     <li><a href="agentlogin.jsp">Agent</a></li>
     <li><a href="logout.jsp">Logout</a></li>
   </ul>
 </div>

</header>
