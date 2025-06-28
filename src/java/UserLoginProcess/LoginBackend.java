package UserLoginProcess;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginBackend", urlPatterns = {"/LoginBackend"})
public class LoginBackend extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String s1 = request.getParameter("ID");
        String s2 = request.getParameter("User_Id");
        String s3 = request.getParameter("pass");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection connection = null;
        PreparedStatement pr = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/StudyPoint?useSSL=false", 
                    "root", "root");

            // Prepare the SQL query
            String sql = "SELECT * FROM registration WHERE Full_Name  = ? AND  User_Id   = ? AND Password = ?";
            pr = connection.prepareStatement(sql);
            pr.setString(1, s1);
            pr.setString(2, s2);
            pr.setString(3, s3);

            // Execute the query
            rs = pr.executeQuery();

            // Check if user exists
            if (rs.next()) 
            {
                HttpSession session =request.getSession();
                session.setAttribute("Id",rs.getString(7));
                response.sendRedirect("HomePage.jsp");  // Redirect to home page on success
                
                
                
            } else 
            {
                out.println("<h1>Invalid credentials, please try again.</h1>");
            }

        } catch (Exception e) {
            // Handle any exceptions
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            // Close resources to prevent memory leaks
            try {
                if (rs != null) rs.close();
                if (pr != null) pr.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                out.println("<h2>Error closing resources: " + ex.getMessage() + "</h2>");
            }
        }
    }

}
