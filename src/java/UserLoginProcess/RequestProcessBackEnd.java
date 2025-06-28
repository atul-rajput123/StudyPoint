/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserLoginProcess;  
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "RequestProcessBackEnd", urlPatterns = {"/RequestProcessBackEnd"})
public class RequestProcessBackEnd extends HttpServlet 
{
     protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       GmailGenrete gmail=new GmailGenrete();
       String email="";
       String User_Id;
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String userId=request.getParameter("ID");
        int i=1;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint?useSSL=false","root","root");
            Statement st=con.createStatement();
            Statement st1=con.createStatement();
            Statement st2=con.createStatement();
            ResultSet rs=st.executeQuery("select * from temporary");
            while(rs.next())
            {
               boolean b=Boolean.parseBoolean(request.getParameter("action_"+i));
               String s=request.getParameter("action_"+i);
               if(b)
               {
                    email=rs.getString(2);
                    String name=rs.getString(1);
                    User_Id=""+name.charAt(0)+rs.getString(3);
                   st1.executeUpdate("insert into  registration values('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+User_Id+"')");
                   String sub="Congratulation '"+rs.getString(1)+"'...."; 
                  
                   String text="'"+rs.getString(1)+"' registration is complete. You can now log in to StudyPoint and start your journey with us Student_ID number '"+User_Id+"'";
                   
                     gmail.sendGmail(rs.getString(2),sub,text);
                     
               }
               
   
               if((b==false&&s!=null)||b)
               {
                  st2.executeUpdate("delete from temporary where Phone_Number='"+rs.getString(3)+"'");
                 
               }
       i++;
            }
            con.close();
        }
        catch(SQLIntegrityConstraintViolationException e)
        {
             String errorMessage = e.getMessage();
             if (errorMessage.contains("registration.Email_Address")) 
             {
                 
                String text="Error: The email address  is already registered.";
                gmail.sendGmail(email,"Dublicte...!",text);
            } 
             else if (errorMessage.contains("registration.Phone_Number")) 
            {
              
                String text="Error: The phone number  is already registered.";
                gmail.sendGmail(email,"Dublicate...!",text);
            } else 
            {
               out.println("Error: Duplicate entry found.");
            }
            
        }
        catch(Exception e)
        {
            out.println(e);
        }
       out.println("<h1>Mail send Succefully</h1>");
     }

    
}

    