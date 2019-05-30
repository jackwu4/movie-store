<%-- 
    Document   : registerAction
    Created on : May 17, 2019, 12:31:32 AM
    Author     : 12806295-Xiaohan Wang (Feature1)
--%>
<%@page import="java.util.Random"%>
<%@page import="model.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Assignment2.*"%>
<%@page import="controller.*"%>
<%@page import="controller.UserValidator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register_Action</title>
    </head>

    <%
        /* get the data transmitted from the form of register,jsp. */
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String dob = request.getParameter("dob");
        char gender = request.getParameter("gender").charAt(0);
        String valPhone = request.getParameter("phone");
        String phone = request.getParameter("phone");
        
        boolean tos = request.getParameter("tos") != null;
        int key = (new Random()).nextInt(999999);
        int ID = key; /* Randomly generated ID */
        String usertype = "Customer"; /* user type is customer */
       

        if (tos) {  /* check whether or not the use r agree with the tos, if yes, the user information data will be stored in database,
                    if not, the user need to back register page and choose to agree with tos */

            /* use javabean and connect to database */
            User user = new User(ID, email, password, firstName, lastName, address, dob, gender, phone, usertype);
            DBManager manager = (DBManager) session.getAttribute("manager");
             /* check is there any user input that does not confirm to the formats established in oms.controller.UserValidator . */
            UserValidator val = new UserValidator();
            if (!val.validateFirstName(firstName)) {
                session.setAttribute("firstNameError", "Incorrect first name format");
                response.sendRedirect("register.jsp");
            } else if (!val.validateLastName(lastName)) {
                session.setAttribute("lastNameError", "Incorrect last name format");
                response.sendRedirect("register.jsp");
            } else if (!val.validateEmail(email)) {
                session.setAttribute("emailError", "Incorrect email format");
                response.sendRedirect("register.jsp");
            } else if (!val.validatePassword(password)) {
                session.setAttribute("passwordError", "Incorrect password format");
                response.sendRedirect("register.jsp");
            } else if (!val.validateDob(dob)) {
                session.setAttribute("dobError", "Incorrect dob format");
                response.sendRedirect("register.jsp");
            } else if (!val.validatePhone(valPhone)) {
                session.setAttribute("phoneError", "Incorrect phone format");
                response.sendRedirect("register.jsp");
            } else if (!val.validateAddress(address)) {
                session.setAttribute("addressError", "Incorrect address format");
                response.sendRedirect("register.jsp");
            } //else if (manager.checkUser(email)) {
               // session.setAttribute("existError", "The email address has been used");
                //response.sendRedirect("register.jsp");
            //} 
                 else {
                manager.addCustomer(ID, firstName, lastName, address, dob, gender, phone); /* add one customer record in databse "Customer" table */
                manager.addUser(ID, usertype, email, password);  /* add one user record in databse "Users" table */
                //session.setAttribute("user", user); /*save the (User)user as a attribute called "user" of session */
                response.sendRedirect("regSuccess.jsp"); /* go to home page*/
            }
            
            //Activate the database add-function once DBManager functions are completed
           
           
            
            
            
        } else { %>
    <p>Sorry, you must agree to the Terms of Service</p>
    <p>Click <a href="register.jsp">here</a> to go back.</p> <!-- submit the register form again -->
    <% }%>

    <body>

    </body>
</html>
