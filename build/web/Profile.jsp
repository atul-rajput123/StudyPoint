<%@page import="Help.ProfileQuerys"%>
<%@page import="java.sql.*"%>
<%
    // Get the user ID from the session
    String userId = (String) session.getAttribute("Id");
    if (userId == null || userId.isEmpty()) {
        out.println("Profile is not available"); // Redirect to login if not logged in
        return;
    }
    ProfileQuerys profile = new ProfileQuerys();
    profile.profile(userId);
    boolean photoExists = false;
    try {
         Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint", "root", "root");
        String query = "SELECT photo FROM profile WHERE id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, userId);
        ResultSet rs = ps.executeQuery();
        if (rs.next() && rs.getBlob("photo") != null) {
            photoExists = true;
        }
    } catch(Exception e) {
        e.printStackTrace(); 
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="HomeCss.css">
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            padding: 20px;
        }


        /* Profile Container */
        .profile-container {
            max-width: 800px;
            margin: 30px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #333;
        }

        /* Profile Photo Section */
        .profile-photo {
            margin-bottom: 20px;
            position: relative;
            display: inline-block;
        }

        .profile-photo img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 4px solid #4CAF50;
            object-fit: cover;
        }

        /* File Upload Below Photo */
        .file-upload-container {
            margin-top: 20px;  /* Adds spacing below the image */
            text-align: center;
        }

        .file-upload-container input[type="file"] {
            padding: 12px 30px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .file-upload-container input[type="file"]:hover {
            background-color: #45a049;
        }

        /* Profile Info Section */
        .profile-info {
            margin-top: 20px;
            font-size: 1.1em;
            line-height: 1.8;
        }

        .profile-info p {
            margin-bottom: 10px;
        }

        .profile-info strong {
            color: #4CAF50;
        }

        /* Button Styles */
        .save-btn {
            margin-top: 20px;
            padding: 12px 30px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .save-btn:hover {
            background-color: #45a049;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .profile-container {
                padding: 20px;
            }

            .profile-info p {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>

    <!-- Profile Container -->
    <div class="profile-container">
        <h1>Your Profile</h1>

        <!-- Profile Photo Section -->
        <div class="profile-photo">
            <% if (photoExists) { %>
                <img src="profile-image?userId=<%= userId %>" alt="Profile Photo" id="profileImage" >
            <% } else { %>
                <p>No photo uploaded. Please upload your photo.</p>
            <% } %>
        </div>

        <!-- File Upload Section Below Photo -->
        <div class="file-upload-container">
            <form method="post" action="ProfilePhoto" enctype="multipart/form-data">
                <input type="file" name="profilePhoto" id="profilePhoto" onchange="previewImage(event)">
                <button type="submit" class="save-btn">Upload Photo</button>
            </form>
        </div>

        <!-- Profile Information Section -->
        <div class="profile-info">
            <p><strong>Name:</strong> <%= profile.name %></p>
            <p><strong>Student ID:</strong> <%= profile.userId %></p>
            <p><strong>Contact:</strong> <%= profile.phone %></p>
            <p><strong>Email:</strong> <%= profile.email %></p>
            <p><strong>Gender:</strong> <%= profile.gender %></p>
        </div>
        <p style="font-size:30px; color: red;  text-align:right"> <a href="HomePage.jsp">Back</a></p>
    </div>

    <script>
        // Preview uploaded image
        function previewImage(event) {
            var image = document.getElementById('profileImage');
            image.src = URL.createObjectURL(event.target.files[0]);
        }
    </script>

</body>
</html>
