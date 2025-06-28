<%-- 
    Document   : Java
    Created on : Oct 25, 2024, 10:09:52 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="HomePageCss.css">
    </head>
    <body>
        <div class="navbar">
        <a href="HomePage.jsp">Home</a>
        <a href="NotesList.jsp">Notes</a>
        <a href="HomePage.jsp">Notes_Download</a>
        <a href="UserExamMCQ.jsp">Exam</a>
         
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
    </body>
</html>
