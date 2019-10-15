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

import model.Customer;

/**
 * Servlet implementation class CustomerLogin
 */
@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("custUserId");
		String pwd = request.getParameter("custUserPwd");
		HttpSession session = request.getSession();
		boolean isValidLogon = false;
		
		try {
			isValidLogon = verifyLogin(userid, pwd);
			if(isValidLogon) {
				session.setAttribute("custUserId", userid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(isValidLogon) {
			response.sendRedirect("customerwelcome.jsp");
		}
		else {
			response.sendRedirect("customerlogin.jsp");
		}
	}
	
	private boolean verifyLogin(String userid, String pwd) throws Exception{
		Connection conn = null;
		boolean isValid = false;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "root", ""); 
			PreparedStatement preparedStatement = conn.prepareStatement("select * from Customers where custUserId=? and custUserPwd=? ");
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
