<%@page import="java.time.LocalTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyPoint - Home</title>

    <link rel="stylesheet" href="HomeCss.css">
    <style>
         body
        {
            background-image: url('Back.png');
        }
        
        .search-bar {
            width: 300px;
            height: 25px;
            padding: 5px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin: 5px;
        }

        .search-button {
            height: 40px;
            padding: 5px 10px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .search-button:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        // JavaScript to show one upcoming test at a time
        let currentTestIndex = 0;
        const tests = [
            "Mock Test 1: Nov 20, 2024",
            "Mock Test 2: Dec 15, 2024",
            "Mock Test 3: Jan 10, 2025"
        ];

        function showNextTest() {
            const testList = document.getElementById("testPoints");
            testList.innerHTML = "";
            const testItem = document.createElement("li");
            testItem.textContent = tests[currentTestIndex];
            testItem.classList.add("test-" + (currentTestIndex + 1));
            testList.appendChild(testItem);

            currentTestIndex = (currentTestIndex + 1) % tests.length;
        }

        // Set an interval to show the next test every 3 seconds
        setInterval(showNextTest, 3000);
    </script>

</head>

<body>

    <!-- Navbar -->
    <div class="navbar">
        <div class="logo-container">
            <!-- Logo placed here with circular shape -->
            <img src="logo.jpg" alt="Logo">
            <div class="navbar-links">
                <a href="Courses.jsp">Courses</a>
                <a href="UserExamMCQ.jsp">Exam</a>
                <a href="notes.html">Result</a>
                
                <form action="Search" method="get">
        <input type="text" name="query" class="search-bar" placeholder="Search..." required>
        <button type="submit" class="search-button">Search</button>
        
                 </form>
                <a href="Contect.jsp">Help</a>
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

    <!-- Main content container with horizontal layout -->
    <div class="main-container">

        <!-- Upcoming Information Section -->
        <div class="section">
            <h2>Upcoming Cources</h2>
            <ul>
                <li>New Mobile App – Study anytime, anywhere!</li>
                <li>Live Tutoring Sessions – Interact with experts in real-time.</li>
                <li>Group Study Rooms – Collaborate with classmates in virtual rooms.</li>
            </ul>
        </div>

        <!-- Upcoming Mock Tests Section -->
        <div class="section">
            <h2>Upcoming Mock Tests</h2>
            <p>Prepare with our realistic mock tests, available soon!</p>
            <ul id="testPoints"></ul>
            <a href="mocktests.jsp">View All Mock Tests</a>
        </div>

        <!-- Upcoming Exams Section -->
        <div class="section">
            <h2>Upcoming Exams</h2>
            <p>Stay updated on important exam dates and preparation tips!</p>
            <ul>
                <li>Midterm Exams: Start on Jan 10, 2025</li>
                <li>Final Exams: Start on May 20, 2025</li>
            </ul>
            <a href="exams.jsp">View Full Exam Schedule</a>
        </div>

    </div>

</body>
</html>
