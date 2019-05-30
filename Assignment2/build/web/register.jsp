<%-- 
    Document   : register
    Created on : May 15, 2019, 10:31:53 PM
    Author     : 12806295-Xiaohan Wang (Feature1)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/navbar.css">
        <title>Register</title>
    </head>
    <body>

        <%
            /* check is there any user input that does not confirm to the formats established in oms.controller.UserValidator . */
            /* These session attributes are set in registerAction.jsp if any input is wrong. */
            String firstNameError = (String) session.getAttribute("firstNameError"); 
            String lastNameError = (String) session.getAttribute("lastNameError");
            String emailError = (String) session.getAttribute("emailError");
            String passwordError = (String) session.getAttribute("passwordError");
            String dobError = (String) session.getAttribute("dobError");
            String phoneError = (String) session.getAttribute("phoneError");
            String addressError = (String) session.getAttribute("addressError");
            String existError = (String) session.getAttribute("existError");
            
            /* message which will display the Error Messages */
            String message; 
            if (firstNameError != null) {
                message = firstNameError;
            } else if (lastNameError != null) {
                message = lastNameError;
            } else if (emailError != null) {
                message = emailError;
            } else if (passwordError != null) {
                message = passwordError;
            } else if (dobError != null) {
                message = dobError;
            } else if (phoneError != null) {
                message = phoneError;
            } else if (addressError != null) {
                message = addressError;
            } else if (existError != null) {
                message = existError;
            } else {
                message = ""; /* No Error Message */
            }


        %>

        <div class="header">
            <h1 style="text-align:center; background-color: black;color: white">Online movie store</h1>  <!--Online Movie Store website name-->
        </div>


        <div class="topnav">                                                <!-- navigation bar -->
            <a href="index.jsp" style="float:left">&lt;Go Back</a>      <!-- a button link to home page -->
<!--            <a  href="logout.jsp">Logout</a>                                   a button link to logout page 
            <a  href="login.jsp">Login</a>                                     a button link to login page -->

        </div>


        <br>
        <h1>Register</h1>
        <br>
        <p style="color:red"><%= message%></p>
        <form action="registerAction.jsp" method="post"> <!-- transmit data (email, password, firstName .....) from register.jsp to registerAction.jsp .  -->
            
            <table>   <!-- create a table -->

                <tr><td>Email</td><td><input size="20" type="text" name="email" placeholder="Email"></td></tr>
                <tr><td>Password</td><td><input size="20" type="password" name="password" placeholder="6 to 20 digits password"></td></tr>
                <tr><td>First Name</td><td><input size="20" type="text" name="firstName" placeholder="First name"></td></tr>
                <tr><td>Last name</td><td><input size="20" type="text" name="lastName" placeholder="Last name"></td></tr>
                <tr><td>Address</td><td><input size="20" type="text" name="address" placeholder="Address"></td></tr>
                <tr><td>Date of Birth</td><td><input type="date" name="dob" ></td></tr>
                <tr><td>Gender</td><td> <input type="radio" name="gender" value="M">Male <input type="radio" name="gender" value="F">Female<br>
                <tr><td>Phone</td><td><input size="50" type="text" name="phone" placeholder="start with 04 and followed by 8 more digits"></td></tr>
                <tr><td>Agree to ToS</td><td><input type="checkbox" name="tos" ><br> 
                <tr><td></td><td><input type="submit" value="Register"> </td></tr>
            </table>   
                
        </form>
        

        <%
            /* remove the session Attribute about "Error" to prevent that the erroe message will always exist after a error happened even if users correct their input*/
            session.removeAttribute("FirstnNameError"); 
            session.removeAttribute("LastnNameError");
            session.removeAttribute("emailError");
            session.removeAttribute("passwordError");
            session.removeAttribute("dobError");
            session.removeAttribute("phoneError");
            session.removeAttribute("addressError");
            session.removeAttribute("existError");
        %>
        
    </body>
</html>
