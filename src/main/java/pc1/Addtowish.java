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

@WebServlet("/Addtowish")
public class Addtowish extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Addtowish() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String uid = (String) session.getAttribute("uid");
        if (uid == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String pid = request.getParameter("pid");
        String pdname = request.getParameter("pdname");
        String pdprice = request.getParameter("pdprice");
        String quantity = request.getParameter("quantity");

        PrintWriter out = response.getWriter();

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database connection
            String databaseurl = "jdbc:mysql://localhost:3306/user";
            String username = "root";
            String password = "Binit.1234";

            Connection con = DriverManager.getConnection(databaseurl, username, password);

            // Check if the product already exists in the wish table
            String sql = "SELECT * FROM wish WHERE uid = ? AND pid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, uid);
            ps.setString(2, pid);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Update the existing record's quantity
                sql = "UPDATE wish SET quantity = quantity + ? WHERE uid = ? AND pid = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, quantity);
                ps.setString(2, uid);
                ps.setString(3, pid);
                ps.executeUpdate();
            } else {
                // Insert a new record
                sql = "INSERT INTO wish (pid, pdname, pdprice, quantity, uid) VALUES (?, ?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, pid);
                ps.setString(2, pdname);
                ps.setString(3, pdprice);
                ps.setString(4, quantity);
                ps.setString(5, uid);
                ps.executeUpdate();
            }

            // Close resources
            ps.close();
            con.close();

            // Redirect to shop page
            response.sendRedirect("shop.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error occurred while adding to wishlist: " + e.getMessage() + "</p>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}