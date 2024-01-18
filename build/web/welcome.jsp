<%-- 
    Document   : welcome
    Created on : Jan 17, 2024, 5:57:00 PM
    Author     : MODERN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <h2>Welcome, <%= session.getAttribute("username")%></h2>
        <p>This is your Dashboard.</p>
        <a href="logout.jsp">Logout</a>
    </body>
</html>
