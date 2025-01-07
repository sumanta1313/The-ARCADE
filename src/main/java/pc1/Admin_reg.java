package pc1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Admin_reg
 */
public class Admin_reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_reg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String aname = request.getParameter("aname");
		String aemail = request.getParameter("aemail");
		String apwd = request.getParameter("apwd");
		PrintWriter  out = response.getWriter();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/user";
			
			String uid = "root";
			
			String pwd = "Binit.1234";
			
			Connection con = DriverManager.getConnection(databaseurl,uid,pwd);
			
			String sql = "insert into admin(aname, aemail, apwd) value(?, ?, ?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			
			ps.setString(1 , aname);
			
			ps.setString(2, aemail);
			
			ps.setString(3, apwd);
			
			ps.executeUpdate();
			
			response.sendRedirect("admin-login.jsp");
	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
