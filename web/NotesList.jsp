<%-- 
    Document   : NotesList
    Created on : Nov 1, 2024, 3:39:46 PM
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="HomeCss.css">
        <title>Notes List</title>
        <style>
            body{
                 background-image: url('Back.png');
            }
            /* Main content styling */
            .content {
                padding: 20px;
                text-align: center;
                font-family: Arial, sans-serif;
            }

            /* Table styling */
            table {
                width: 80%;
                margin: 0 auto;
                border-collapse: collapse;
                font-size: 18px;
            }

            table, th, td {
                border: 1px solid #ddd;
                padding: 12px;
            }

            th {
                background-color: #4CAF50;
                color: white;
                font-size: 20px;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }

            /* Link styling */
            a {
                color: black;
                text-decoration: none;
                font-weight: bold;
            }

            a:hover {
                color: #045D25;
                text-decoration: underline;
            }

            /* Center alignment */
            .center {
                text-align: center;
            }

            /* Button styling */
            .navbar a, .dropdown-content a {
                font-size: 18px;
            }
            /* Right-align the course, semester, and year */
        .right-align {
            text-align: left;
            font-size: 18px;
            padding-right: 20px;
        }
        </style>
    </head>
    <body>
        <!-- Navbar -->
    <div class="navbar">
        <div class="logo-container">
            <!-- Logo placed here with circular shape -->
            <img src="logo.jpg" alt="Logo">
            <div class="navbar-links">
                <a href="HomePage.jsp">Home</a>
                <a href="Courses.jsp">Courses</a>
                
            </div>
        </div>

        <div class="navbar-right">
            <a href="profile.html">Profile</a>
            <div class="dropdown">
                <button class="dropbtn">More &#9660;</button>
                <div class="dropdown-content">
                    <a href="#">Settings</a>
                    <a href="#">Logout</a>
                </div>
            </div>
        </div>
    </div>
        <div class="content">
            <h1>StudyPoint Notes</h1>
            <%
                  String course=request.getParameter("course");
                String sem=request.getParameter("semester");
                String year=request.getParameter("year"); 
            %>
            <!-- Display course, semester, and year on the right -->
        <div class="right-align">
            <p>Course: <%= course %></p>
            <p>Semester: <%= sem %></p>
            <p>Year: <%= year %></p>
        </div>
            <%
                
             
                String query="SELECT * FROM "+course+sem;
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint?useSSL=false", "root", "root");
                PreparedStatement stm = con.prepareStatement(query);
                ResultSet rs = stm.executeQuery();
            %>
            <table>
                <tr>
                    <th colspan="3" class="center">Subjects</th>
                </tr>
                <%
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String fileName = rs.getString(2);
                        String fileType = rs.getString(3);
                %>
                <tr>
                    <td><a href="FileDisplay?id=<%=id %>"><%=fileName %></a></td>
                    <td><a href="NotesDownload?id=<%=id %>">Download</a></td>
                    <td><a href="VideoDisplay?id=<%=id %>">Video</a></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
               
                con.close();
            %>
        </div>
    </body>
</html>
