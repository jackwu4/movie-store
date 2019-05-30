<%-- 
    Document   : account
    Created on : May 28, 2019, 4:06:00 PM
    Author     : 12806295-Xiaohan Wang (Feature1)
--%>

<%@page import="model.dao.*"%>
<%@page import="Assignment2.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/navbar.css">
        <title>Account</title>

    </head>

    <body>
        <%
            if (session.getAttribute("userLogin") != null) {
                User userLogin = (User) session.getAttribute("userLogin");
                
                DBManager manager = (DBManager) session.getAttribute("manager");
                User user = manager.findUser(userLogin.getEmail());
                session.setAttribute("user", user);
        %>


        <div class="header">
            <h1 style="text-align:center; background-color: black;color: white">Online movie store</h1>
        </div>

        <div class="topnav">
            <a href="management.jsp" style="float:left">&lt;Back to Management  </a>
<!--            <a  href="logout.jsp">Logout</a>
            <a  href="login.jsp">Login</a>
            <a  href="register.jsp">Register</a>-->

        </div>
        <br>
        <h1>Account</h1>

        <%           /* if the "update" button is choosed, a hidden input called "update" will be submitted , if not,skip the following if statement*/ 
               if (request.getParameter("updated") != null) 
           {    /* update the corresponding data in database */
                manager.updateCustomer(user.getId(), request.getParameter("firstName"), request.getParameter("lastName"), request.getParameter("address"),
                        request.getParameter("dob"), request.getParameter("gender"), request.getParameter("phone"));
                manager.updateUser(user.getId(), user.getUsertype(), request.getParameter("email"), request.getParameter("password"));
                User userEdit = manager.findUser(request.getParameter("email"));

                if (userEdit != null) {
                    session.removeAttribute("user"); /* change the content of session attribute "user" to let users immediately see the changes in the account table after they choosed "update" button. */
                    session.setAttribute("user", userEdit);
                    user = (User) session.getAttribute("user");
        %>
        <p style="color:yellowgreen"> Your details updated.</p> 
                <%} else {%>
        <p style="color:red"> Could not update database!</p> 
                     <%}%>
         <%}%>


        <form action="account.jsp" method="post"> <!-- information data will be transmitted to this page again -->
            <table>   <!-- create a table -->
                <tr><td>Email</td><td><input size="20" type="text" name="email" placeholder="Email" value="<%= user.getEmail()%>"></td></tr>
                <tr><td>Password</td><td><input size="20" type="password" name="password" placeholder="6 to 20 digits password" value="<%= user.getPassword()%>"></td></tr>
                <tr><td>First Name</td><td><input size="20" type="text" name="firstName" placeholder="First name" value="<%= user.getFirstName()%>"></td></tr>
                <tr><td>Last name</td><td><input size="20" type="text" name="lastName" placeholder="Last name" value="<%= user.getLastName()%>"></td></tr>
                <tr><td>Address</td><td><input size="20" type="text" name="address" placeholder="Address"value="<%= user.getAddress()%>"></td></tr>
                <tr><td>Date of Birth</td><td><input type="date" name="dob" value="<%= user.getDob()%>"></td></tr>
                        <%if (user.getGender() == 'M' || user.getGender() == 'm') {%>
                <tr><td>Gender</td><td> <input type="radio" name="gender" value="M" checked="checked">Male <input type="radio" name="gender" value="F">Female<br>
                        <%} else {%>
                <tr><td>Gender</td><td> <input type="radio" name="gender" value="M" >Male <input type="radio" name="gender" value="F" checked="checked">Female<br>
                        <%}%>
                <tr><td>Phone</td><td><input size="50" type="text" name="phone" placeholder="start with 04 and followed by 8 more digits" value="<%= user.getPhone()%>"></td></tr>
                <tr><td><input type="hidden" value="updated" name="updated"></td> <!-- if the data is updated, a hidden input called "updated" will be submitted along with above information data -->
                    <td><input type="submit" value="Update">
                        &emsp; 
                        <button type="button" onclick="location.href = 'cancelAccount.jsp'" >Cancel Account</button></td>
                </tr>
            </table>   

        </form>
        <%} else {%> 
        <p>You are not logged in.Click <a href="home.jsp">here</a> to go back.</p> 
        <!-- if a user is anonymous , he/she can't see his/her account because he/she doesn't log in or have a account -->
        <%}%>

    </body>
</html>

