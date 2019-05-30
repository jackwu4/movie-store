<%-- 
    Document   : AddStaffMember
    Created on : 16/05/2019, 6:59:54 PM
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ page import="Assignment2.Staff" %>
    <%@ page import="model.dao.*"%>
    <%@ page import="model.*" %>
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
        <h2 style="text-align:center;">Editing Staff Member</h2>
        <p style="text-align:center;">
            
            <% DBManager storeadmin = (DBManager)session.getAttribute("manager");
               int staffid = Integer.parseInt(request.getParameter("ID"));
               Staff staff = storeadmin.findStaffByID(staffid);
            %>

            <form style="margin: 0 auto; width: 250px;" action="EditStaffAction.jsp?eID=<%=request.getParameter("ID")%>">
                <table>
                    <tr>
                        <td>First Name</td>
                        <td> <input name="firstname" type="text" value="<%=staff.getFirstName()%>">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Last Name</td>
                        <td> <input name="lastname" type="text" value="<%=staff.getLastName()%>">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Email</td>
                        <td><input name="email" type="text" value="<%=staff.getEmail()%>">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Password</td>
                        <td><input name="password" type="password" value="<%=staff.getPassword()%>">
                        </td>
                    </tr>
                    
                    <tr>
                    <td>Position</td>
                    <td>
                     <select name="staffpos" value="<%=staff.getPosition()%>">
                     <option value="Store Manager">Store Manager</option>
                     <option value="Inventory Manager">Inventory Manager</option>
                     <option value="Salesperson">Salesperson</option>
                     <option value="Admin">Administrator</option>
                     </select>
                    </td>
                    </tr>
                    
                    <tr>
                        <td>Address</td>
                        <td><input name="address" type="text" value="<%=staff.getAddress()%>">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Status</td>
                        <td>
                            <input type="radio" name="status" value="Activated">Activate
                            <br>
                            <input type="radio" name="status" value="Deactivated" checked>Deactivate
                        </td>
                    </tr>
                    
                    <tr><td><input type="submit" formmethod="post" value="submit"></td></tr>
                    
                </table>
            </form></p>
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
