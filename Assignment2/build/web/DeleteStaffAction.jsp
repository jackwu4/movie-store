<%-- 
    Document   : DeleteStaffAction
    Created on : 29-May-2019, 00:38:06
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ page import="Assignment2.Staff" %>
    <%@ page import="model.dao.*"%>
    <%@ page import="model.*" import="java.sql.*"%>
    <%@page import="java.util.*"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administration</title>
    </head>
    <body>
        <%
            int ID = Integer.parseInt(request.getParameter("ID"));
            DBManager staffadmin = (DBManager)session.getAttribute("manager");
            staffadmin.deleteStaff(ID);
            response.sendRedirect("ViewStaffMembers.jsp"); 
        %>
    </body>
</html>
