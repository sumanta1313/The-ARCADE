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
import java.sql.SQLException;

/**
 * Servlet implementation class Udcart
 */
public class Udcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Udcart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		 HttpSession session = request.getSession();
		    String uid = (String) session.getAttribute("uid");
		    String pid = request.getParameter("pid");
		    PrintWriter out = response.getWriter();

		    if (uid == null || pid == null) {
		        out.println("User ID or Product ID is not set.");
		        return;
		    }

		    String databaseUrl = "jdbc:mysql://localhost:3306/user";
		    String username = "root";
		    String password = "Binit.1234";

		    try {
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        try (Connection con = DriverManager.getConnection(databaseUrl, username, password)) {
		            if (request.getParameter("update") != null) {
		                String quantityParam = request.getParameter("quantity");
		                if (quantityParam == null || quantityParam.isEmpty()) {
		                    out.println("Quantity is required for updating.");
		                    return;
		                }
		                int quantity = Integer.parseInt(quantityParam);

		                try (PreparedStatement ps = con.prepareStatement("UPDATE cart SET quantity=? WHERE uid=? AND pid=?")) {
		                    ps.setInt(1, quantity);
		                    ps.setString(2, uid);
		                    ps.setString(3, pid);

		                    int affectedRows = ps.executeUpdate();
		                    response.sendRedirect("cart.jsp");
		                }
		            }

		            if (request.getParameter("delete") != null) {
		                try (PreparedStatement ps = con.prepareStatement("DELETE FROM cart WHERE uid=? AND pid=?")) {
		                    ps.setString(1, uid);
		                    ps.setString(2, pid);

		                    int affectedRows = ps.executeUpdate();
		                    response.sendRedirect("cart.jsp");
		                }
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        out.println("SQL Error: " + e.getMessage());
		    } catch (ClassNotFoundException e) {
		        e.printStackTrace();
		        out.println("Driver not found: " + e.getMessage());
		    } catch (NumberFormatException e) {
		        out.println("Invalid quantity format.");
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
