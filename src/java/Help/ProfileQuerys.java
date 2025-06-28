/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Help;

import java.sql.*;

public class ProfileQuerys {
    public String name;
    public String userId;
    public String email;
    public String gender;
    public String phone;
     
          public void profile(String useId) 
          {
              try
              {
           
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint?useSSL=false", "root", "root");
         Statement st=con.createStatement();
       
         ResultSet rs = st.executeQuery("SELECT * FROM registration WHERE User_Id = '"+useId+"'");

         
            
            if(rs.next())
            {
                
               name=rs.getString(1);
                userId=rs.getString(7);
                email=rs.getString(2);
                gender=rs.getString(4);
                 phone=rs.getString(3);
                
            }
            con.close();
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        
   
        
      }
   
}

