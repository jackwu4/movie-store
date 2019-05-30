<%-- 
    Document   : cancelAccount
    Created on : May 28, 2019, 4:27:20 PM
    Author     : 12806295-Xiaohan Wang (Feature1)
--%>

<%@page import="Assignment2.*"%>
<%@page import="model.dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%
            User user = (User) session.getAttribute("user");
            DBManager manager = (DBManager) session.getAttribute("manager");
            manager.deleteCustomer(user.getId()); /* delete a customer from the database*/
            manager.deleteUser(user.getId()); /* delete a user from the database*/
            session.removeAttribute("user"); /* destroy the data information of user which stored in session */
            session.invalidate();
        %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel_Account</title>
    </head>
    <body>
        <p>You have been canceled your account.Click <a href="index.jsp">here</a> to go back.</p> <!-- back to home page-->
    </body>
</html>
