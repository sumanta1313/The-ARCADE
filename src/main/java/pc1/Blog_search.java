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
 * Servlet implementation class Blog_search
 */
@WebServlet("/Blog_search")
public class Blog_search extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Blog_search() {
        super();
    }

    /**
     * Handles GET requests.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        try {
            // Parse the "bid" parameter
            String bidParam = request.getParameter("bid");
            if (bidParam == null || bidParam.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Blog ID (bid) is missing.");
                return;
            }

            int bid = Integer.parseInt(bidParam);

            // Database connection details
            String databaseUrl = "jdbc:mysql://localhost:3306/user";
            String uid = "root";
            String pwd = "Binit.1234";

            // Load JDBC driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(databaseUrl, uid, pwd)) {
                String query = "SELECT image FROM blog WHERE bid = ?";
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    ps.setInt(1, bid);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            byte[] imageBytes = rs.getBytes("image");

                            // Set response headers
                            response.reset();
                            response.setContentType("image/jpeg");
                            response.setHeader("Content-Disposition", "inline; filename=image.jpg");

                            // Write image to response output stream
                            response.getOutputStream().write(imageBytes);
                            response.getOutputStream().flush();
                        } else {
                            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No blog found with the specified ID.");
                        }
                    }
                }
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid blog ID (bid). It must be an integer.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }

    /**
     * Handles POST requests by delegating to doGet().
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
