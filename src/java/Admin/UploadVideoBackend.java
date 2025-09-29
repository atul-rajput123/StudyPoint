
package Admin;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "UploadVideoBackend", urlPatterns = {"/UploadVideoBackend"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  
    maxFileSize = 50 * 1024 * 1024,   
    maxRequestSize = 100 * 1024 * 1024 
)
public class UploadVideoBackend extends HttpServlet 
{

   

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
      PrintWriter out=response.getWriter();
        
        javax.servlet.http.Part videoPart=request.getPart("video");
        String videoName=videoPart.getSubmittedFileName(); 
        String videoType=videoPart.getContentType();
        
        InputStream video=videoPart.getInputStream();
        byte videoData[]=new byte[video.available()];
        video.read(videoData);
        
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint?useSSL=false","root","root");
            PreparedStatement st=con.prepareStatement("insert into  VideoLecture(video_name,video_type,video_data) values(?,?,?)");
            st.setString(1, videoName);
            st.setString(2, videoType);
            st.setBytes(3,videoData);
            int row=st.executeUpdate();
            if(row>0)
            {
                out.println("video upload successFully");
            }
            else
            {
               out.println("video is not upload"); 
            }
            con.close();
        }
        catch(Exception e)
         {
             out.println(e);       
         }  
    }

}
