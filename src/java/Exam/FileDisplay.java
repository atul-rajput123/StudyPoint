/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Exam;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.*;

@WebServlet(name = "FileDisplay", urlPatterns = {"/FileDisplay"})
public class FileDisplay extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint?useSSL=false", "root", "root")) {
                PreparedStatement stm = con.prepareStatement("SELECT * FROM B_Tech1Sem WHERE id = ?");
                stm.setInt(1, id);
                ResultSet rs = stm.executeQuery();

                if (rs.next()) {
                    String fileName = rs.getString(2); // Use actual column name
                    String fileType = rs.getString(3); // Use actual column name
                    byte[] data = rs.getBytes(4); // Assuming 'data' is the file data column

                    // Set the correct MIME type
                    response.setContentType(fileType);

                    // Set Content-Disposition to display the file inline with the correct filename
                    response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");

                    // Set content length
                    response.setContentLength(data.length);

                    // Write the file data to the response output stream
                    try (OutputStream outputStream = response.getOutputStream()) {
                        outputStream.write(data);
                        outputStream.flush();
                    }
                } else {
                    response.setContentType("text/html");
                    response.getWriter().println("File Not Found");
                }
            }
        } catch (Exception e) {
            response.setContentType("text/html");
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
