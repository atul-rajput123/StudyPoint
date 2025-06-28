package UserLoginProcess;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "RegistrationBackend", urlPatterns = {"/RegistrationBackend"})
public class RegistrationBackend extends HttpServlet 
{
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        PrintWriter out=response.getWriter();
        String name=request.getParameter("Name");
        String emails=request.getParameter("Email"); 
        String contect=request.getParameter("Phone");
        String gender=request.getParameter("Gender");
        String pass=request.getParameter("Password");
        String conf=request.getParameter("Confirm_Password");
       
      try
      {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint?useSSL=false","root","root");
          Statement st=con.createStatement();
          st.executeUpdate("insert into Temporary values('"+name+"','"+emails+"','"+contect+"','"+gender+"','"+pass+"','"+conf+"')");
          con.close();
          
      }
      catch(Exception e)
      {
          out.println(e);
      }
      
      out.println("<h1>Form Submit SuccesFUlly and Your Profile will be verified in the next 24 hource and send Email </h1>");

    }
}
