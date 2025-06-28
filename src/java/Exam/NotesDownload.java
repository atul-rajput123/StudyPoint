package Exam;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet(name = "NotesDownload", urlPatterns = {"/NotesDownload"})
public class NotesDownload extends HttpServlet 
{    

    @Override
    protected  void  doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
    {
        int id=Integer.parseInt(request.getParameter("id"));
        //PrintWriter out=response.getWriter();
        //out.println("<html>");
        //out.println("<body>");
        //out.println("<center>");
        

        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/atul_rajput?useSSL=false","root","root");
           PreparedStatement st=con.prepareStatement("select * from prectice where id=?");
           st.setInt(1,id);
           ResultSet rs=st.executeQuery();
           if(rs.next())
           {
              String fileName=rs.getString(2);                
              String fileType=rs.getString(3); 
              byte data[]=rs.getBytes(4);
               if (fileType.equalsIgnoreCase("pdf"))
               {
                    response.setContentType("application/pdf");
                }
               else if (fileType.equalsIgnoreCase("image")) 
               {
                    response.setContentType("image/jpeg");
                } else if (fileType.equalsIgnoreCase("text")) 
                {
                    response.setContentType("text/plain");
                }
                response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                try (OutputStream outputStream = response.getOutputStream()) {
                    outputStream.write(data); 
                }
           }
           else
           {
              response.getOutputStream().write("File not found".getBytes()); 
           }
           con.close();
        }
        catch(Exception e)
        {
              response.getOutputStream().write(("Error: " + e.getMessage()).getBytes());
        }
        //out.println("<h1>Download SuccessFully</h1>");
        //out.println("</center>");
        //out.println("</body>");
        //out.println("</html>");
    }
}
