<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WellCome to Registration Page</title>
<link rel="stylesheet" href="RegistrationCss.css">
</head>
<body>  
    <!-- Navbar Section -->
    <div class="navbar">
        <!-- Navbar links aligned to the right -->
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

    <!-- Form Section -->
    <center>
        <form action="RegistrationBackend" method="post">
            <table class="table">
                <tr>
                    <th></th>
                </tr>
                <tr>
                    <td><input type="text" placeholder="Full Name" name="Name" class="sizetext1"></td>
                </tr>
                <tr>
                    <td><input type="Email" placeholder="Email Address" name="Email" class="sizetext1"></td>
                </tr>
                <tr>
                    <td><input type="text" placeholder="Phone Number" name="Phone" class="sizetext1"></td>
                </tr>
                <tr>
                    <td><input type="text" placeholder="Gender" name="Gender" class="sizetext1"></td>
                </tr>
                <tr>
                    <td><input type="password" placeholder="Password" name="Password" class="sizetext1"></td>
                </tr>
                <tr>
                    <td><input type="password" placeholder="Confirm Password" name="Confirm_Password" class="sizetext1"></td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <input type="submit" placeholder="Submit" class="button" id="hover-item">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
