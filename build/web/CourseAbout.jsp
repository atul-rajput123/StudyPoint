<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Box Example</title>
    <style>
    /* Ensures the body takes up the full height and centers content */
    html, body {
         background-image: url('Registration.png');
        height: 100%;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #f4f4f4; /* Background color of the page */
        font-family: Arial, sans-serif;
    }

    /* Smaller box size */
    .box {
        width: 400px;
        padding: 20px;
        background-color: #2F4F4F; /* Box color */
        border: 2px solid #2980b9; /* Border for the box */
        border-radius: 8px; /* Rounded corners */
        box-shadow: rgba(0, 0, 0, 0.25) 0px 15px 20px, rgba(0, 0, 0, 0.15) 0px -5px 10px;
    }

    /* Styling for labels and select elements */
    label {
        color: #f4f4f4;
        font-size: 14px;
        font-weight: bold;
        margin-right: 10px;
    }

    /* Table styling */
    table {
        width: 100%;
    }
    
    td {
        padding: 10px;
        text-align: center;
    }

    select {
        width: 100%;
        padding: 8px;
        border-radius: 4px;
        border: 1px solid #2980b9;
        color: #333;
        font-size: 14px;
        background-color: #ffffff;
    }
    </style>
</head>
<body>
    <form action="NotesList.jsp">
    <div class="box">
        <center>
            <table>
                <tr>
                    <td>
                        <label for="course">Course:</label>
                        <select id="course" name="course">
                            <option value="B_Tech">B.TECH</option>
                            <option value="mtech">M.TECH</option>
                            <option value="bca">BCA</option>
                            <option value="mca">MCA</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="year">Year:</label>
                        <select id="year" name="year">
                            <option value="1">1 Year</option>
                            <option value="2">2 Year</option>
                            <option value="3">3 Year</option>
                            <option value="4">4 Year</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="semester">Semester:</label>
                        <select id="semester" name="semester">
                            <option value="1Sem">1 Sem</option>
                            <option value="2">2 Sem</option>
                            <option value="3">3 Sem</option>
                            <option value="4">4 Sem</option>
                            <option value="5">5 Sem</option>
                            <option value="6">6 Sem</option>
                            <option value="7">7 Sem</option>
                            <option value="8">8 Sem</option>
                        </select>
                    </td>
                </tr>
               
            </table>
             <input type="submit">
        </center>
    </div>
        </form>
</body>
</html>
