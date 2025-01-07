package pc1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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
 * Servlet implementation class Update_pd
 */
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, 
	    maxFileSize = 1024 * 1024 * 10,      
	    maxRequestSize = 1024 * 1024 * 50   
	)
public class Update_pd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_pd() {
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
		
		
		HttpSession s = request.getSession();
		
		String pid = request.getParameter("pid");
		
		String pdname = request.getParameter("pdname");
		String pdprice = request.getParameter("pdprice");
		String pddetails = request.getParameter("pddetails");
		String pdcat = request.getParameter("pdcat");
		
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
			String sql = "update product set pdname=?, pdprice=?, pddetails=?, image=? , pdcat=? where pid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(6, pid);
			ps.setString(5, pdcat);
			ps.setBinaryStream(4, filePart.getInputStream());
			ps.setString(3, pddetails);
			ps.setString(2, pdprice);
			ps.setString(1, pdname);
			
			ps.executeUpdate();
			
        	response.sendRedirect("product.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
