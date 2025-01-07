package pc1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Upload_file
 */

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, 
	    maxFileSize = 1024 * 1024 * 10,      
	    maxRequestSize = 1024 * 1024 * 50   
	)
public class Upload_file extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload_file() {
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
	        String pdname = request.getParameter("pdname");
	        String pdprice = request.getParameter("pdprice");
	        String pddetails = request.getParameter("pddetails");
	        String pdcat = request.getParameter("pdcat");

	        try (PrintWriter out = response.getWriter()) {
	            Part filePart = request.getPart("image"); // Extract the file from the request
	            if (filePart == null || filePart.getSize() <= 0) {
	                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "File is missing. Please upload a valid file.");
	                return;
	            }

	            // Database connection details
	            String databaseUrl = "jdbc:mysql://localhost:3306/user";
	            String uid = "root";
	            String pwd = "Binit.1234";

	            Class.forName("com.mysql.cj.jdbc.Driver");

	            try (Connection con = DriverManager.getConnection(databaseUrl, uid, pwd)) {
	            	  String sql = "INSERT INTO product (pdname, pdprice, pddetails, image, pdcat) VALUES (?, ?, ?, ?, ?)";
	                try (PreparedStatement ps = con.prepareStatement(sql)) {
	                    ps.setString(1, pdname);
	                    ps.setString(2, pdprice);
	                    ps.setString(3, pddetails);
	                    ps.setBinaryStream(4, filePart.getInputStream(), filePart.getSize());
	                    ps.setString(5, pdcat);  
	                    
	                    int rowsInserted = ps.executeUpdate();
	                    if (rowsInserted > 0) {
	                    	response.sendRedirect("product.jsp");
	                    } else {
	                        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to insert data into the database.");
	                    }
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
	        }
	    }
	}
