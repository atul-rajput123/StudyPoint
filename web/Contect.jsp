<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <link rel="stylesheet" href="HomeCss.css">
       <style>
            body
        {
            background-image: url('Back.png');
        }
           /* Main content container */
            .main-container {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                padding: 20px;
                gap: 10px; /* Space between the columns */
            }

            /* Left large box styling */
            .left-box {
                background-color: #ffffff;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                border-radius: 10px;
                text-align: center;
                transition: all 0.3s ease;
                width: 50%; /* Takes 60% width of the main container */
                height:500px;
            }

            /* Right side container for two small boxes */
            .right-container {
                display: flex;
                flex-direction: column;
                gap: 10px;
                width: 600px; /* Takes 35% width of the main container */
                 height:530px; 
            }

            /* Small box styling */
            .small-box {
                background-color: #ffffff;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                border-radius: 10px;
                text-align: center;
                transition: all 0.3s ease;
                height: 300px; /* Set height as needed */
            }

            /* Section hover effect */
            .left-box:hover, .small-box:hover {
                background-color: #e6f7ff;
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
                transform: translateY(-10px);
            }

            /* Content styling */
            h2 {
                color: red;
                font-size: 1.8em;
                margin-bottom: 10px;
            }

            p {
                color: #666;
                font-size: 1.1em;
            }
       </style>
    </head>
    <body>
        <div class="navbar">
            <div class="logo-container">
                <img src="logo.jpg" alt="Logo">
                <div class="navbar-links">
                    <a href="HomePage.jsp">Home</a>
                </div>
            </div>
            <div class="navbar-right">
                <a href="Profile.jsp">Profile</a>
                <div class="dropdown">
                    <button class="dropbtn">More &#9660;</button>
                    <div class="dropdown-content">
                        <a href="#">Settings</a>
                        <a href="RegistrationUser.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="main-container">
            <!-- Left large box -->
            <div class="left-box">
                <h2>Chartboard</h2>
                <p>How can I help you?</p>
            </div>

            <!-- Right container with two small boxes -->
            <div class="right-container">
                <div class="small-box">
                    <h2>Please send your query through email</h2>
               
                </div>
                <div class="small-box">
                    <h2>Contact us anytime for support</h2>
                    <p>HelpLine Number .</p>
                </div>
            </div>
        </div>
    </body>
</html>
