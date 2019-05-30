<%-- 
    Document   : logout
    Created on : 17/05/2019, 2:36:37 PM
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ page import="Assignment2.Staff" %>
    <%@ page import="model.dao.*"%>
    <%@ page import="model.*" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging Out</title>
    </head>
    <body>
        <%
        session.invalidate();
        response.sendRedirect("AdminLogin.jsp");
        %>
    </body>
</html>
