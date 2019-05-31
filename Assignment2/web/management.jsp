<%-- 
    Document   : management
    Created on : 16/05/2019, 6:26:47 PM
    Author     : 13599790 Chenzhi Wu
--%>
<%@page import="model.dao.*"%>
<%@page import="Assignment2.*"%>
<%@page contentType="text/html" import="Assignment2.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header><h1 style="text-align:center; background-color: black;color: white">Online movie store</h1></header>
        <h1>Management page</h1>
        <%
        //User user = new User();
        //user.setEmail(request.getParameter("email"));
        //user.setPassword(request.getParameter("password"));
       // user.login();
        User userTemp = (User)session.getAttribute("userLogin");
        DBManager manager = (DBManager) session.getAttribute("manager");
        User user = null;
        if(userTemp != null){
        user = manager.findUser(userTemp.getEmail());
        }
        
    %>
    <body onload="startTime()">
        <div><span class="time" id="time" ></span></div>
        <% if(user != null) { %> 
        <h1>Hello, <%= user.getFirstName() %></h1> 
        <p>Your ID is: <%= user.getID() %></p>
        <p>Your email: <%= user.getEmail() %></p>
        <p>Your DOB: <%= user.getDob() %></p>
        <p>Your password is: <%= user.getPassword() %></p>        
        <p>Your Address is: <%= user.getAddress()%></p>        
        <p>Your Gender is: <%= user.getGender()%></p>       
        <p>Your Phone is: <%= user.getPhone()%></p>       
        <%            
            //session.setAttribute("theUser",user);
        %>
        <button class="button" type="button" onclick="location.href = 'log.jsp'" > User Login Logs </button>
        <button class="button" type="button" onclick="location.href = 'account.jsp'" > Edit Account </button>
        <button class="button" type="button" onclick="location.href = 'view.jsp'" > View Order History </button>
        <button class="button" type="button" onclick="location.href = 'Catalogue.jsp'" > Catalogue Management </button>
        <button class="button" type="button" onclick="location.href = 'logout.jsp'" > Logout </button>
        <%}else{%>
        <p class="outline"> Login unsuccessful! </p>
        <button class="button" type="button" onclick="location.href = 'login.jsp'" > Login Page </button>
        <%}%>        
        
    </body>
    </body>
    
</html>
