<%-- 
    Document   : login
    Created on : 17/05/2019, 2:47:12 PM
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
        <title>Logging In</title>
    </head>
    
       <body>
            <%
            DBManager manager = (DBManager)session.getAttribute("manager");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Staff admin = null;
            admin = manager.findStaff(email, password);
            if (admin != null && (admin.getStatus()).equals("Activated") && admin.getPosition().equals("Admin")) { 
                session.setAttribute("adminLogin", admin);
                response.sendRedirect("AdminLanding.jsp");                        
            }else{
                session.setAttribute("loginErr", "Account Information Incorrect Or Is Not An Active Admin");
                response.sendRedirect("AdminLogin.jsp?e=1");                               
            }             
        %>
       </body>
</html>
