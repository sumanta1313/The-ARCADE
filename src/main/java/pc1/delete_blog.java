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
 * Servlet implementation class delete_blog
 */
@WebServlet("/delete_blog")
public class delete_blog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_blog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				//response.getWriter().append("Served at: ").append(request.getContextPath());
				
				String bid = request.getParameter("bid");
				
				try {
					
				    PrintWriter out = response.getWriter();
				    PreparedStatement psImageInsertDatabase = null;
				    
				    Class.forName("com.mysql.cj.jdbc.Driver");
				    String databaseurl = "jdbc:mysql://localhost:3306/user";
				    String uid = "root";
				    String pwd = "Binit.1234";
				    
				    Connection con = DriverManager.getConnection(databaseurl, uid, pwd);
				    String sqlImageInsertDatabase =  "delete from blog WHERE bid = ?";
				    psImageInsertDatabase = con.prepareStatement(sqlImageInsertDatabase);
				    
				    psImageInsertDatabase.setString(1, bid);
				    
				    psImageInsertDatabase.executeUpdate();
				    response.sendRedirect("blog-li.jsp");
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
