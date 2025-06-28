<%-- 
    Document   : Login
    Created on : Oct 25, 2024, 8:22:35 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | StudyPoint</title>

   <link rel="stylesheet" href="RegistrationCss.css">
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <a href="RegistrationUser.jsp">Registration</a>
        <a href="Login.jsp">Login</a>
        <a href="About.jsp">About</a>
    </div>
    

    <!-- Logo and Welcome Message Section -->
    <div class="logo-container">
        <!-- Logo placed here with circular shape -->
        <img src="logo.jpg" alt="Logo">
        <!-- Welcome message next to logo -->
        <div class="welcome-message">
            Welcome to Study Point
        </div>
    </div>

        <form action="LoginBackend" method="post">
            <table class="table">
                <tr>
                    <td><input type="text" placeholder="Full Name" name="ID" class="sizetext1"></td>
                </tr>
                <tr>
                    <td><input type="text" placeholder="Student_Id Number" name="User_Id" class="sizetext1"></td>
                </tr>
                <tr>
                    <td><input type="password" placeholder="Password" name="pass" class="sizetext1"></td>
                </tr>
                <tr>
                    <td><input type="password" placeholder="Confirm Password" name="conform_pass" class="sizetext1"></td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <input type="submit" value="Login" class="button">
                    </td>
                </tr>
            </table>
        </form>
    </div>

</body>
</html>
