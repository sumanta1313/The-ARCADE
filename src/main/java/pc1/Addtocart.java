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
 * Servlet implementation class Addtocart
 */
public class Addtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addtocart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession s = request.getSession();
		
		String uid = (String) s.getAttribute("uid");
		
		if(uid==null)
		{
			response.sendRedirect("login.jsp");
		}
		
		String pid = request.getParameter("pid");
		
		String pdname = request.getParameter("pdname");
		
		String pdprice = request.getParameter("pdprice");
		
		String quantity = request.getParameter("quantity");
		
			
		PrintWriter out = response.getWriter();

		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/user";
			String un = "root";
			String pwd = "Binit.1234";
					
			Connection con = DriverManager.getConnection(databaseurl,un,pwd);
			String sql = "select * from cart where uid=? and pid=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, uid);
			ps.setString(2, pid);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()==true)
			{
				sql = "update cart set quantity=quantity+? where uid=? and pid=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, quantity);
				ps.setString(2, uid);
				ps.setString(3, pid);
				ps.executeUpdate();
				ps.close();
			}
			else
			{
				sql = "insert into cart values(?,?,?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setString(1, pid);
				ps.setString(3, pdprice);
				ps.setString(4, quantity);
				ps.setString(2, pdname);
				ps.setString(5, uid);
				ps.executeUpdate();
			}
			
			response.sendRedirect("cart.jsp");

		}
		catch(Exception e)
		{
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
