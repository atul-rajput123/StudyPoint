<%-- 
    Document   : RequestProcess
    Created on : Oct 25, 2024, 7:26:15 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Records</title>
        <style type="text/css">
body {
	background-image: url('BackGround.jpg');
}
</style>
    </head>
    <body>
        <h1>Manage Records</h1>

        <form  action="RequestProcessBackEnd">
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone_Number</th>
                    <th>Gender</th>
                    <th>Password</th>
                    <th>Conform_Password</th>
                    <th>Action</th>
                </tr>

                <%
                    int id=1;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/StudyPoint?useSSL=false", 
                            "root", 
                            "root"
                        );
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from Temporary");
                        while (rs.next()) {
                              // Assuming the ID is unique
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(5) %></td>
                    <td><%= rs.getString(6) %></td>
                    <td>
                         <input type="radio" name="action_<%= id %>" value="true"> Accept
                        <input type="radio" name="action_<%= id %>" value="false"> Delete
                    </td>
                </tr>
                <%
                        id++; }
                        con.close();
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    }
                %>
            </table>
            <input type="hidden" name="ID" value="<%= id %>">
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>