package Admin;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;


@WebServlet(name = "FileDataInsert", urlPatterns = {"/FileDataInsert"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  
    maxFileSize = 50 * 1024 * 1024,  
    maxRequestSize = 100 * 1024 * 1024 
)
public class FileDataInsert extends HttpServlet {

  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
      
       PrintWriter out = response.getWriter();
      Part FileData=request.getPart("File");
       String fileName=FileData.getSubmittedFileName();
       String fileType=FileData.getContentType();
       InputStream inputStream=FileData.getInputStream();
       
       try
       {
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint?useSSL=false","root","root");
       PreparedStatement stm=con.prepareStatement("insert into mca1sem(File_Name,file_type,File_Data) values(?,?,?)");
       stm.setString(1,fileName);
       stm.setString(2,fileType);
       stm.setBlob(3,inputStream);
      int check=stm.executeUpdate();
      if(check>0)
      {
          out.println("insert file successfull");
      }
      else 
      {
          out.println("File Not Insert");
      }
       }
       catch(Exception e)
       {
           out.println(e);
       }
           
    }

}

