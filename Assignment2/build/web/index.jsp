<%-- 
    Document   : index
    
    Author     : jackw
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="controller.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <script type="text/javascript" src="js/script.js"></script>
        <title>Home Page</title>       
    </head>
     <body onload="startTime()">
         <div><span class="time" id="time" ></span></div>      
        <h1 style="text-align:center; background-color: black;color: white">Online movie store</h1>  
        <div align="center"> 
            <a class="link" href="register.jsp"> Register </a> 
            &emsp; 
            <a class="link" href="login.jsp">Login</a>
            &emsp; 
            <a class="link" href="AdminLogin.jsp">Admin Login</a> 
        </div>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
