<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Assignment2.*"%>
<%@page import="controller.*"%>
<!DOCTYPE html>

<%-- 
    Document   : regSuccess
    Created on : May 29, 2019
    Author     : 12806295-Xiaohan Wang (Feature1)
--%>

<html>
    <head>
        <title>Home Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/navbar.css">
        <style>
            p {text-align:center}
        </style>
    </head>
    <body>

        <div class="header">                          <!--Online Movie Store website name-->
            <h1 style="text-align:center; background-color: black;color: white">Online movie store</h1>
        </div>

        <<div align="center">                              <!-- navigation bar -->
<!--            <a  href="logout.jsp">Logout</a>               a button link to logout page -->
<!--            <a  href="account.jsp">Account</a>             a button link to account page -->
            <a  href="login.jsp">Login</a>                <!-- a button link to login page -->
            <a  href="register.jsp">Register</a>          <!-- a button link to register page -->

        </div>

        <%
//            String message;
//            /* message which will display on the center of home page to show the username of user or "anonymous user" for people who hasn't logged in yet  */
//            User user = (User) session.getAttribute("user");
//            if (user != null) {
//                message = "Hi, " + user.getFirstName() + " " + user.getLastName() + " &lt" + user.getEmail() + "&gt.";
//            } else {
//                message = "Hi,&lt anonymous user &gt, you are not logged in.";
//            }
        %>          
        <br />
        <p>Registration Complete, Click links above to Login or Register another account</p>  <!-- display message -->
<!--        <jsp:include page="/ConnServlet" flush="true" />  connect to database -->
    </body>
</html>
