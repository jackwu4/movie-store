<%-- 
    Document   : logout
    Created on : 17/05/2019, 2:07:39 PM
    Author     : 13599790 Chenzhi Wu
--%>
<%@page import="model.dao.*"%>
<%@page import="controller.*"%>
<%@page contentType="text/html" import="Assignment2.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>Logout</title>
    </head>
    <body onload="startTime()">
        <header>
        <h1 style="text-align:center; background-color: black;color: white">Online movie store</h1>
        </header>
        <div><span class="time" id="time" ></span></div>
        <%           
            User user = (User)session.getAttribute("userLogin");
            DBManager manager = (DBManager)session.getAttribute("manager");
            manager.logout(user.getID());
            session.invalidate();
        %>
        <p class="outline">You have been logged out. Click <a class="link" href="index.jsp">here</a> to return to the welcome page.</p>
    </body>
</html>
