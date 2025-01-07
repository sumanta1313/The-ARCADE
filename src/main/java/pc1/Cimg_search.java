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
import java.sql.ResultSet;

/**
 * Servlet implementation class Cimg_search
 */
public class Cimg_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cimg_search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String uid = request.getParameter("uid");
		PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/user";
			String id = "root";
			String pwd = "Binit.1234";
			
			Connection con = DriverManager.getConnection(databaseurl,id,pwd);
			String query = "select photo from person where uid=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, uid);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				byte[] b = rs.getBytes("photo");
				
				response.reset();
				response.setContentType("photo/jpg");
				response.setHeader("Content-Disposition", "attachment; filename=photo.jpg");
				
				response.getOutputStream().write(b,0,b.length);
				response.getOutputStream().flush();
			}
			
	}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
