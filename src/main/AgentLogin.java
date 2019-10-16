package main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Agent;

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
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("agtUserId");
		String pwd = request.getParameter("agtUserPwd");
		HttpSession session = request.getSession();
		Agent agt = new Agent();
		
		try {
			agt = verifyLogin(userid, pwd);
			if(agt.getAgentId() > 0) {
				session.setAttribute("agentId", agt.getAgentId());
				session.setAttribute("agtFirstName", agt.getAgtFirstName());
				response.sendRedirect("agentwelcome.jsp?agentid="+agt.getAgentId());
			} else {
				response.sendRedirect("agentlogin.jsp?login=invalid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private Agent verifyLogin(String userid, String pwd) throws Exception{
		Connection conn = null;
		Agent agt = new Agent();
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "root", ""); 
			PreparedStatement preparedStatement = conn.prepareStatement("select agentId, agtFirstName from Agents where agtUserId=? and agtUserPwd=? ");
            preparedStatement.setString(1, userid);
            preparedStatement.setString(2, pwd);
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            agt.setAgentId(rs.getInt("agentId"));
            agt.setAgtFirstName(rs.getString("agtFirstName"));
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return agt;
	}
}
