<%-- 
    Document   : Courses
    Created on : Oct 25, 2024, 9:58:00 PM
    Author     : ASUS
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="HomeCss.css">  
        <style>
            /* Table styling with hover effects */
            body{
                 background-image: url('Back.png');
            }
table {
    border-collapse: collapse;
    width: 80%;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

table tr:nth-child(even) {
    background-color: #f2f2f2;
}

table tr:hover {
    background-color: #ddd;
}

table th {
    background-color: #333;
    color: white;
}
        </style>
    </head>
    <body>
         <div class="navbar">
        <div class="logo-container">
            <!-- Logo placed here with circular shape -->
            <img src="logo.jpg" alt="Logo">
            <div class="navbar-links">
                <a href="HomePage.jsp">Home</a>
                <a href="Contect.jsp">Contact</a>
                
            </div>
        </div>

        <div class="navbar-right">
            <a href="Profile.jsp">Profile</a>
            <div class="dropdown">
                <button class="dropbtn">More &#9660;</button>
                <div class="dropdown-content">
                    <a href="#">Settings</a>
                    <a href="#">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <center>
        <table border="1">
            <tr>
            <th>Course ID</th>
            <th>Course Name</th>
            <th>Description</th>
        </tr>
        <%
            try
            {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306:/StudyPoint?useSSL=false","root","root");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint?useSSL=false","root","root");       
            PreparedStatement st=con.prepareStatement("select * from Cource");
             ResultSet rs=st.executeQuery();
             int id=1;
             while(rs.next())
             {
                 out.println("<tr>");
                 //out.println("<td><a href='CourseAbout.jsp'>"+rs.getString(1)+"</a></td>");
                 // Display each course name as a clickable link (even if not unique)
                  out.println("<td>"+rs.getString(1)+"</td>");
                    out.println("<td><a style=\"color:red;\" href='CourseAbout.jsp?courseName=" + id + "'>" + rs.getString(2) + "</a></td>");
                    id++;
                 out.println("<td>"+rs.getString(3)+"</td>");
                 out.println("</tr>");
                 
                 
             }
            }
            catch(Exception e)
            {
                out.print(e);
            }
        %>
        </table>
    </center>
    </body>
</html>
