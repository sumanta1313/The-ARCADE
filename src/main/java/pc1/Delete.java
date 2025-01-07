package pc1;

import jakarta.servlet.ServletException;
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
 * Servlet implementation class Delete
 */
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String pid = request.getParameter("pid");
		
		try {
			
		    PrintWriter out = response.getWriter();
		    PreparedStatement psImageInsertDatabase = null;
		    
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    String databaseurl = "jdbc:mysql://localhost:3306/user";
		    String uid = "root";
		    String pwd = "Binit.1234";
		    
		    Connection con = DriverManager.getConnection(databaseurl, uid, pwd);
		    String sqlImageInsertDatabase =  "delete from product WHERE pid = ?";
		    psImageInsertDatabase = con.prepareStatement(sqlImageInsertDatabase);
		    
		    psImageInsertDatabase.setString(1, pid);
		    
		    psImageInsertDatabase.executeUpdate();
		    response.sendRedirect("product.jsp");
		} catch (Exception ex) {
		    ex.printStackTrace();
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
