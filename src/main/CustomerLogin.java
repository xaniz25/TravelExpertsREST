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
		String userid = request.getParameter("custUserId"); //get from form
		String pwd = request.getParameter("custUserPwd");
		int custid = 0;
		HttpSession session = request.getSession();
		
		try {
			custid = verifyLogin(userid, pwd);
			System.out.print(custid);
			if(custid > 0) {
				session.setAttribute("customerId", custid);
				response.sendRedirect("book.jsp");
			} else {
				response.sendRedirect("customerlogin.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private int verifyLogin(String userid, String pwd) throws Exception{
		Connection conn = null;
		int custid = 0;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "root", ""); 
			PreparedStatement preparedStatement = conn.prepareStatement("select customerId from Customers where custUserId=? and custUserPwd=? ");
            preparedStatement.setString(1, userid);
            preparedStatement.setString(2, pwd);
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            custid = rs.getInt("customerId");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		System.out.print(custid);
		return custid;
	}

}
