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
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("custUserId");
		String pwd = request.getParameter("custUserPwd");
		HttpSession session = request.getSession();
		Connection conn = null;
		
		//checks database if userid and pwd combination exists
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "root", ""); 
			PreparedStatement preparedStatement = conn.prepareStatement("select customerId, custFirstName from Customers where custUserId=? and custUserPwd=? ");
            preparedStatement.setString(1, userid);
            preparedStatement.setString(2, pwd);
            ResultSet rs = preparedStatement.executeQuery();
	            if(rs.next()) {
	            int custid = rs.getInt("customerId");
	            session.setAttribute("customerId", custid);
	            String fname = rs.getString("custFirstName");
	            session.setAttribute("custFirstName", fname);
	            response.sendRedirect("customerwelcome.jsp?welcome="+fname);
				} else {
					response.sendRedirect("customerlogin.jsp?login=invalid");
				}
	            conn.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
    }
	}
