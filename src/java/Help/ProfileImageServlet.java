/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Help;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "ProfileImageServlet", urlPatterns = {"/profile-image"})
public class ProfileImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint", "root", "root")) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String query = "SELECT photo FROM profile WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getBlob("photo") != null) {
                Blob photoBlob = rs.getBlob("photo");
                response.setContentType("image/jpeg");
                try (InputStream is = photoBlob.getBinaryStream(); OutputStream os = response.getOutputStream()) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = is.read(buffer)) != -1) {
                        os.write(buffer, 0, bytesRead);
                    }
                }
            } else {
                response.sendRedirect("default-placeholder.png"); // Placeholder for missing image
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching image.");
        }
    }
}
