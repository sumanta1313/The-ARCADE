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
 * Servlet implementation class File_search
 */
public class File_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public File_search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/user";
			String uid = "root";
			String pwd = "Binit.1234";
			
			Connection con = DriverManager.getConnection(databaseurl,uid,pwd);
			String query = "select image from product where pid=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, pid);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				byte[] b = rs.getBytes("image");
				
				response.reset();
				response.setContentType("image/jpg");
				response.setHeader("Content-Disposition", "attachment; filename=image.jpg");
				
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
		doGet(request, response);
	}

}
