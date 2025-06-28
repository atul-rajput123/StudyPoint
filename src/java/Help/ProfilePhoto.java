package Help;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "ProfilePhoto", urlPatterns = {"/ProfilePhoto"})
@MultipartConfig
public class ProfilePhoto extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("Id"); // Retrieve userId from session
        Part photoPart = request.getPart("profilePhoto");

        if (photoPart != null && userId != null) {
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint", "root", "root")) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String query = "UPDATE profile SET photo = ? WHERE id = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setBlob(1, photoPart.getInputStream());
                ps.setString(2, userId);

                int rows = ps.executeUpdate();
                if (rows > 0) {
                    session.setAttribute("message", "Photo uploaded successfully!");
                } else {
                    session.setAttribute("message", "Failed to upload photo.");
                }
                
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("message", "Error: " + e.getMessage());
                response.sendRedirect("profile.jsp");
            }
        } 
    }
}
