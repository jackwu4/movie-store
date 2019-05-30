<%-- 
    Document   : AdminLanding
    Created on : 16/05/2019, 6:00:17 PM
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
        <link rel="stylesheet" href="css/admin.css"> 
        <title>Administration</title>
    </head>
    <body>
        <h1 style="text-align:center; background-color: black;color: white">Online movie store</h1>
        <% Staff admin = (Staff)session.getAttribute("adminLogin"); 
        %>
        <% if( admin !=null && admin.getStatus().equals("Activated") && admin.getPosition().equals("Admin")) {%> 
        <ul>
            <li><a href="AdminLanding.jsp">Home</a></li>
            <li><a href="AddStaffMember.jsp">Add Staff</a></li>
            <li><a href="ViewStaffMembers.jsp">Staff List</a></li>
            <li><a href="AdminLogout.jsp">Logout</a></li>
        </ul>
        <h2 style="text-align:center;">Welcome to the Administration Page.</h2>
        <p style="text-align:center;">
        This is the administration page for the online movie store.
        <br>
        <a href="AddStaffMember.jsp">Add Staff Member</a>
        <br>
        <a href="ViewStaffMembers.jsp">View Staff Members</a>
        </p>
        <%} 
        else{%>
        <p style="text-align:center;">You are not authorized to access this page.
            <br>
            <a href="AdminLogin.jsp">Click here to login.</a>
        </p>
        
        <%}
        %>
    </body>
</html>
