<%-- 
    Document   : ResultShow
    Created on : Oct 26, 2024, 12:42:31 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
    body
    {
         background-image: url('Back.png');
    }
</style>
</head>
<body>
	<% int ResultCount = (Integer) request.getAttribute("ResultCount");%>
	<h1><%=ResultCount %></h1>
</body>
</html>