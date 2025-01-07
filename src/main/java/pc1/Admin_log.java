package pc1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Admin_log
 */
public class Admin_log extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_log() {
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
		
		String aemail = request.getParameter("aemail");
		String apwd = request.getParameter("apwd");
		
		PrintWriter out = response.getWriter();
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/user";
			String uid = "root";
			String pwd = "Binit.1234";
					
			Connection con = DriverManager.getConnection(databaseurl,uid,pwd);
			String sql = "select * from admin where aemail=? and apwd=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
		
			ps.setString(1, aemail);
			ps.setString(2, apwd);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()==true)
			{

				HttpSession s = request.getSession();
				
				s.setAttribute("aemail", aemail);
				
				s.setAttribute("aname", rs.getString("aname"));
				
				s.setAttribute("aid", rs.getString("aid"));

				
				System.out.print("test");
				
				response.sendRedirect("product.jsp");
				
//				String redirectLocation = "index.jsp";
//				
//				response.setHeader("location", redirectLocation);
				
			}
			else
			{
				response.sendRedirect("admin-login.jsp?error=1");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
