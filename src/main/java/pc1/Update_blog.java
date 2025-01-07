package pc1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Update_blog
 */
@WebServlet("/Update_blog")
public class Update_blog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_blog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		HttpSession s = request.getSession();
		
		String bid = request.getParameter("bid");
		
		String bname = request.getParameter("bname");
		String bdate = request.getParameter("bdate");
		String bdetails1 = request.getParameter("bdetails1");
		String bdetails2 = request.getParameter("bdetails2");
		
		PrintWriter out = response.getWriter();
		try {
			
			Part filePart = request.getPart("image"); 
		    if (filePart == null) {
		        throw new IllegalArgumentException("File part is null or empty. Please upload a valid file.");
		    }
		    
		    
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/user";
			String uid = "root";
			String pwd = "Binit.1234";
					
			Connection con = DriverManager.getConnection(databaseurl,uid,pwd);
			String sql = "update blog set bname=?, bdate=?, bdetails1=?, bdetails2=?, image=?  where bid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(6, bid);
			ps.setString(5, bdetails2);
			ps.setBinaryStream(4, filePart.getInputStream());
			ps.setString(3, bdetails1);
			ps.setString(2, bdate);
			ps.setString(1, bname);
			
			ps.executeUpdate();
			
        	response.sendRedirect("blog-li.jsp");
		} catch (Exception e) {
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
