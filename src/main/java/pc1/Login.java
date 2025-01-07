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
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
				String pmail = request.getParameter("pmail");
				String pw = request.getParameter("pwd");
				
				PrintWriter out = response.getWriter();
				try 
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					
					String databaseurl = "jdbc:mysql://localhost:3306/user";
					String uid = "root";
					String pwd = "Binit.1234";
							
					Connection con = DriverManager.getConnection(databaseurl,uid,pwd);
					String sql = "select * from person where pmail=? and pwd=? ";
					PreparedStatement ps = con.prepareStatement(sql);
					
				
					ps.setString(1, pmail);
					ps.setString(2, pw);
					
					ResultSet rs = ps.executeQuery();
					
					if(rs.next()==true)
					{

						HttpSession s = request.getSession();
						
						s.setAttribute("pmail", pmail);
						
						s.setAttribute("pname", rs.getString("pname"));
						
						s.setAttribute("photo", rs.getString("photo"));
						
						s.setAttribute("uid", rs.getString("uid"));
						
						response.sendRedirect("index.jsp");
						
						
					}
					else
						response.sendRedirect("login.jsp?error=1");
				} catch (Exception e) {
					e.printStackTrace();
				}
	}

}
