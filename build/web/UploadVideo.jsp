<%-- 
    Document   : UploadVideo
    Created on : Nov 11, 2024, 12:45:39 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UploadVideoBackend" method="post" enctype="multipart/form-data">
            <input type="file" name="video">
        <input type="submit">
        </form>
    </body>
</html>
