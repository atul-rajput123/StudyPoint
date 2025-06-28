<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About StudyPoint</title>
        <link rel="stylesheet" href="RegistrationCss.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f7f7f7;
                margin: 0;
                padding: 0;
            }
            .navbar {
                background-color: #333;
                overflow: hidden;
            }
            .navbar a {
                float: left;
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }
            .navbar a:hover {
                background-color: #ddd;
                color: black;
            }
            .container {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
                font-size: 2.5em;
                margin-top: 20px;
            }
            .features {
                display: flex;
                justify-content: space-around;
                margin-top: 30px;
            }
            .feature {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 30%;
                text-align: center;
            }
            .feature h3 {
                color: #333;
                font-size: 1.5em;
            }
            .feature p {
                font-size: 1em;
                color: #555;
            }
            .mission {
                text-align: center;
                margin-top: 50px;
                background-color: #333;
                color: white;
                padding: 20px;
                border-radius: 10px;
            }
            .mission h2 {
                font-size: 2em;
            }
            .mission p {
                font-size: 1.2em;
                line-height: 1.6;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <div class="navbar">
            <a href="RegistrationUser.jsp">Registration</a>
            <a href="Login.jsp">Login</a>
            <a href="About.jsp">About</a>
        </div>
        
        <!-- About Content -->
        <div class="container">
            <h1>About StudyPoint</h1>
            <p>StudyPoint is your all-in-one platform for managing study materials, notes, and videos. Designed to help students access essential study resources in one place, it provides an easy way to stay organized and focused.</p>
            
            <div class="features">
                <div class="feature">
                    <h3>Study Materials</h3>
                    <p>Access a wide variety of study materials, including downloadable files, notes, and practice exercises.</p>
                </div>
                <div class="feature">
                    <h3>Video Tutorials</h3>
                    <p>Watch educational videos covering various subjects to deepen your understanding and enhance your learning.</p>
                </div>
                <div class="feature">
                    <h3>Exam Management</h3>
                    <p>Prepare for exams by reviewing exam schedules, past papers, and mock tests.</p>
                </div>
            </div>

            <div class="mission">
                <h2>Our Mission</h2>
                <p>Our mission is to make studying more accessible and efficient by providing a platform that centralizes all essential resources. We aim to empower students to take control of their learning journey and achieve academic success.</p>
            </div>
        </div>
    </body>
</html>
