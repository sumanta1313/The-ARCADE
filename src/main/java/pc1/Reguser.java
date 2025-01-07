package pc1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Reguser
 */
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, 
	    maxFileSize = 1024 * 1024 * 10,      
	    maxRequestSize = 1024 * 1024 * 50   
	)
public class Reguser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reguser() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		String pname = request.getParameter("pname");
		String pmail = request.getParameter("pmail");
		String pw = request.getParameter("pwd");
		Part imagePart = request.getPart("photo");
		PrintWriter  out = response.getWriter();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/user";
			
			String uid = "root";
			
			String pwd = "Binit.1234";
			
			Connection con = DriverManager.getConnection(databaseurl,uid,pwd);
			
			String sql = "insert into person(pname, pmail, pwd, photo) value(?, ?, ?, ?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			
			ps.setString(1 , pname);
			
			ps.setString(2, pmail);
			
			ps.setString(3, pw);
			
			if (imagePart != null) {
                InputStream imageStream = imagePart.getInputStream(); 
                ps.setBinaryStream(4, imageStream, (int) imagePart.getSize());
            } else {
                ps.setNull(4, java.sql.Types.BLOB); // If no image is uploaded
            }

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("registration.jsp?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("registration.jsp?error=2");
        }
    }
}
