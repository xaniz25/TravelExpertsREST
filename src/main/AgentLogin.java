/* Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers */

package main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AgentLogin
 */
@WebServlet("/AgentLogin")
public class AgentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgentLogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("agtUserId");
		String pwd = request.getParameter("agtUserPwd");
		HttpSession session = request.getSession();
		Connection conn = null;
		
		//checks database if userid and pwd combination exists
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "root", ""); 
			PreparedStatement preparedStatement = conn.prepareStatement("select agentId, agtFirstName from Agents where agtUserId=? and agtUserPwd=? ");
            preparedStatement.setString(1, userid);
            preparedStatement.setString(2, pwd);
            ResultSet rs = preparedStatement.executeQuery();
	            if(rs.next()) {
	            int agtid = rs.getInt("agentId");
	            session.setAttribute("agentId", agtid);
	            String fname = rs.getString("agtFirstName");
	            session.setAttribute("agtFirstName", fname);
	            response.sendRedirect("agentwelcome.jsp?welcome="+fname);
				} else {
					response.sendRedirect("agentlogin.jsp?login=invalid");
				}
	            conn.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
    }
}
