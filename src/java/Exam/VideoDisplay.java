package Exam;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet(name = "VideoDisplay", urlPatterns = {"/VideoDisplay"})
public class VideoDisplay extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint?useSSL=false", "root", "root");
            PreparedStatement st = con.prepareStatement("SELECT * FROM VideoLecture WHERE id = ?");
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                String videoName = rs.getString(2);
                String videoType = rs.getString(3);
                byte[] videoData = rs.getBytes(4);
                
               

                 response.setContentType(videoType);
            response.setHeader("Content-Disposition", "inline; filename=\"" + videoName + "\"");
            response.setContentLength(videoData.length);

            // Write video data directly to response
            try (OutputStream outputStream = response.getOutputStream()) {
                outputStream.write(videoData);
            }
               
            }else {
                response.getWriter().println("Video not found");
            }

            con.close();

        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
