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

@WebServlet("/Upload_blog")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, 
    maxFileSize = 1024 * 1024 * 10,      
    maxRequestSize = 1024 * 1024 * 50   
)
public class Upload_blog extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Upload_blog() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("GET request is not supported for this servlet.");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bname = request.getParameter("bname");
        String bdate = request.getParameter("bdate");
        String bdetails1 = request.getParameter("bdetails1");
        String bdetails2 = request.getParameter("bdetails2");

        try (PrintWriter out = response.getWriter()) {
            Part filePart = request.getPart("image"); 
            if (filePart == null || filePart.getSize() <= 0) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "File is missing. Please upload a valid file.");
                return;
            }

            String databaseUrl = "jdbc:mysql://localhost:3306/user";
            String uid = "root";
            String pwd = "Binit.1234";

            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection(databaseUrl, uid, pwd)) {
                String sql = "INSERT INTO blog (bname, bdate, bdetails1, bdetails2, image) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, bname);
                    ps.setString(2, bdate);
                    ps.setString(3, bdetails1);
                    ps.setString(4, bdetails2);
                    ps.setBinaryStream(5, filePart.getInputStream(), filePart.getSize());

                    int rowsInserted = ps.executeUpdate();
                    if (rowsInserted > 0) {
                        response.sendRedirect("blog-li.jsp");
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
