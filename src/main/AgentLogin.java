package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

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
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("agtUserId");
		String pwd = request.getParameter("agtUserPwd");
		HttpSession session = request.getSession();
		boolean isValidLogon = false;
		
		try {
			isValidLogon = verifyLogin(userid, pwd);
			if(isValidLogon) {
				session.setAttribute("agtUserId", userid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(isValidLogon) {
			response.sendRedirect("agentwelcome.jsp");
		}
		else {
			response.sendRedirect("agentlogin.jsp");
		}
	}
	
	private boolean verifyLogin(String userid, String pwd) throws Exception{
		Connection conn = null;
		boolean isValid = false;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "root", ""); 
			PreparedStatement preparedStatement = conn.prepareStatement("select * from Agents where agtUserId=? and agtUserPwd=? ");
            preparedStatement.setString(1, userid);
            preparedStatement.setString(2, pwd);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()) {
            	isValid = true;
            }
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return isValid;
	}
}
