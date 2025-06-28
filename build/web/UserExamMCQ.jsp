<%@page import="Help.ProfileQuerys"%>
<%@ page import="java.util.ArrayList, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MCQ Questions</title>
    <link rel="stylesheet" href="HomeCss.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: row;
             background-image: url('Back.png');
        }

       
       
        /* Main content area */
        .main-content {
            margin-left: 400px; /* Space for the sidenav */
            width: calc(100% - 260px); /* Adjust width to account for sidenav */
            padding: 20px;
        }

        /* Card container */
        .card-container {
            
            width: 100%;
            height: 450px; /* Set height for the container */
            overflow: hidden;
            position: relative;
          box-shadow: 5px 13px 40px 16px rgba(37,24,24,0.78) inset;
-webkit-box-shadow: 5px 13px 40px 16px rgba(37,24,24,0.78) inset;
-moz-box-shadow: 5px 13px 40px 16px rgba(37,24,24,0.78) inset;
        }

        .content-div {
            display: none;
            width: 100%;
            height: 100%;
            overflow-y: auto;
        }

        .content-div.active {
            display: block;
        }

        .card {
            margin: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: rgba(98,106,96,0.44)
        }

        .text {
            font-size: 35px;
            line-height: 1.6;
        }

        .nav-button {
            text-align: center;
            margin-top: 20px;
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        .buttons button {
            padding: 10px;
            margin: 5px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .buttons button:hover {
            background-color: #0056b3;
        }

        .nav-button button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .nav-button button:hover {
            background-color: #218838;
        }

        /* Adjust button layout for questions */
        .button {
            padding: 10px;
            margin: 5px;
            background-color: #f0f0f0;
            color: #333;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .button.active {
            background-color: #007bff;
            color: white;
        }
        .button1
        {
           background-color: red; 
           color: white;
           width: 10%;
            height: 20%;
        }
        .sidenav {
    width: 250px;
    height: 100vh;
    background-color: #f8f9fa; /* Light grey/cream color for sidebar */
    padding: 20px;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
    position: fixed;
    overflow-y: auto; /* Scrollable content if it overflows */
    font-family: 'Arial', sans-serif;
}

.profile-section {
    text-align: left;
}

.profile-section h2 {
    color: #343a40; /* Dark grey for headings */
    font-size: 1.5rem;
    margin-bottom: 20px;
    border-bottom: 2px solid #e9ecef;
    padding-bottom: 10px;
}

.profile-section p {
    color: #495057; /* Neutral color for text */
    font-size: 1rem;
    margin: 10px 0;
    line-height: 1.5;
}

.profile-section p strong {
    color: #007bff; /* Blue for labels to make them stand out */
}

.sidenav p {
    transition: color 0.3s ease-in-out;
}

.sidenav p:hover {
    color: #0056b3; /* Slightly darker blue on hover for text */
}

    </style>
    <script>
         //var timeLeft = 3 * 60 * 60; // 3 hours = 10800 seconds
         var timeLeft = 60; // 3 hours = 10800 seconds

        function updateCountdown() {
            var hours = Math.floor(timeLeft / 3600); // Calculate hours
            var minutes = Math.floor((timeLeft % 3600) / 60); // Calculate minutes
            var seconds = timeLeft % 60; // Calculate seconds

            // Format the time in HH:MM:SS (ensure 2 digits for each unit)
            if (hours < 10) hours = "0" + hours;
            if (minutes < 10) minutes = "0" + minutes;
            if (seconds < 10) seconds = "0" + seconds;

            // Display the countdown
            document.getElementById("countdown").innerHTML = hours + ":" + minutes + ":" + seconds;

            // Decrease the time
            timeLeft--;

            
            // When time reaches 0, close the page
            if (timeLeft < 0)
            {
                window.location.href = "HomePage.jsp";// Close the page
            }
        }

        // Start the countdown timer
        setInterval(updateCountdown, 1000); // Update every second
    </script>
</head>
<body>

    <div class="sidenav">
      <div class="sidenav">
    <div class="profile-section">
        <h1>Student About</h1>
        <%
             String s=(String)session.getAttribute("Id");
            ProfileQuerys profiles=new ProfileQuerys();
        profiles.profile("Id");%>
        <p><strong>Name:</strong> <%= profiles.name %></p>
        <p><strong>User ID:</strong> <%= profiles.userId %></p>
        <p><strong>Phone:</strong> <%= profiles.phone %></p>
        <p><strong>Email:</strong> <%= profiles.email %></p>
        <p><strong>Gender:</strong> <%= profiles.gender %></p>
        
    <p>Time remaining for the exam: <span id="countdown" style="font-size: 36px; font-weight: bold;">03:00:00</span></p>
    </div>
</div>

    </div>

    <div class="main-content">
        <form action="Result" method="post">
            <%
                ArrayList<String> list = new ArrayList<String>();
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint?useSSL=false", "root", "root");
                    PreparedStatement prepare = connection.prepareStatement("select * from javamcq");
                    ResultSet rs = prepare.executeQuery();
                    while (rs.next()) {
                        list.add(rs.getString(1));
                        list.add(rs.getString(2));
                        list.add(rs.getString(3));
                        list.add(rs.getString(4));
                        list.add(rs.getString(5));
                        list.add(rs.getString(6));
                    }
                } catch (Exception e) 
                {
                    out.println(e);
                }
                int i = 0;
                int j = 0;
                int question = 1;
                int range = 4;
                int k = 1;
               HttpSession session1 = request.getSession();
                session1.setAttribute("selectedOptions", list); 
            %>

            <div class="card-container">
                <%
                    for (i = 0; i < list.size(); i += 6, range = i + 4) {
                %>
                <div class="content-div" id="content-<%= k %>">
                    <div class="card">
                        <div class="text" id="text<%= k %>">
                            <%= "Q_" + (question++) + " " + list.get(i) %>
                            <%
                                for (j = i + 1; j <= range && j < list.size(); j++) {
                            %>
                            <br>
                            <input type="radio" name="checkbox_<%= k %>" value="<%= list.get(j) %>">
                            <%= list.get(j) %>
                            <%
                                }
                                k++;
                            %>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>

            <div class="nav-button">
                <button type="button" id="prev-button">Previous</button>
                <button type="button" id="next-button">Next</button>
            </div>
             
            <button class="button1" type="submit">Submit</button>
        </form>

        <div class="buttons">
            <% for (int r = 0; r < k - 1; r++) { %>
               <button class="button" id="button-<%= r %>">
                Question <%= r + 1 %>
            </button>
            <% } %>
        </div>

    </div>

    <script>
        let currentIndex = 0; // Start at the first question
        const totalQuestions = <%= k %> - 1; // Total number of questions

        // Show the first question
        document.querySelectorAll('.content-div')[currentIndex].classList.add('active');

        document.getElementById('next-button').onclick = function() {
            if (currentIndex < totalQuestions - 1) {
                // Remove the active class from current div
                document.querySelectorAll('.content-div')[currentIndex].classList.remove('active');
                // Move to the next div
                currentIndex++;
                document.querySelectorAll('.content-div')[currentIndex].classList.add('active');
                updateQuestionButtons();
            }
        };

        document.getElementById('prev-button').onclick = function() {
            if (currentIndex > 0) {
                // Remove the active class from current div
                document.querySelectorAll('.content-div')[currentIndex].classList.remove('active');
                // Move to the previous div
                currentIndex--;
                document.querySelectorAll('.content-div')[currentIndex].classList.add('active');
                updateQuestionButtons();
            }
        };

        function updateQuestionButtons() {
            const buttons = document.querySelectorAll('.buttons .button');
            buttons.forEach((button, index) => {
                if (index === currentIndex) {
                    button.classList.add('active');
                } else {
                    button.classList.remove('active');
                }
            });
        }

        // Attach click event to question buttons
        document.querySelectorAll('.buttons .button').forEach((button, index) => {
            button.onclick = function() {
                // Remove the active class from current div
                document.querySelectorAll('.content-div')[currentIndex].classList.remove('active');
                // Show the selected question
                currentIndex = index;
                document.querySelectorAll('.content-div')[currentIndex].classList.add('active');
                updateQuestionButtons();
            };
        });
    </script>
</body>
</html>
