<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
<%
    // Invalidate the current session to log out the user
    session.invalidate();

    // Redirect to the login page after logout
    response.sendRedirect("login.jsp");
%>
</body>
</html>