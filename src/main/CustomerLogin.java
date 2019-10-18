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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("custUserId");
		String pwd = request.getParameter("custUserPwd");
		HttpSession session = request.getSession();
		Connection conn = null;
		
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
