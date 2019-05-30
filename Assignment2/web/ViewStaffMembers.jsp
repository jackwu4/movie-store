<%-- 
    Document   : ViewStaffMembers
    Created on : 17/05/2019, 3:20:16 PM
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
        <link rel="stylesheet" href="css/admin.css"> 
        <title>Administration</title>
    </head>
    <body>
        <h1 style="text-align:center; background-color: black;color: white">Online movie store</h1>
        <% Staff admin = (Staff)session.getAttribute("adminLogin"); %>
        <% if( admin !=null && admin.getStatus().equals("Activated") && admin.getPosition().equals("Admin")) {%>
        <ul>
            <li><a href="AdminLanding.jsp">Home</a></li>
            <li><a href="AddStaffMember.jsp">Add Staff</a></li>
            <li><a href="ViewStaffMembers.jsp">Staff List</a></li>
            <li><a href="AdminLogout.jsp">Logout</a></li>
        </ul>
        <form action ="ViewStaffMembers.jsp">
        <div class="search">
            <input class="searchinput" type="text" name="searchpos" placeholder="Search staff by typing in a position">
            <button type="submit" class="searchbutton">Search</button>
        </div>
        </form>
        <table class="viewstaff">
            <tr>
                <th>ID</th>
                <th>FIRST NAME</th>
                <th>LAST NAME</th>
                <th>EMAIL</th>
                <th>STAFF POSITION</th>
                <th>ADDRESS</th>
                <th>STATUS</th>
            </tr>
        <% 
        DBManager storeadmin = (DBManager)session.getAttribute("manager");
        String searchpos ="";
        try{
        searchpos = request.getParameter("searchpos");}
        catch(NullPointerException e){
            searchpos="";
        }
        if(!"".equals(searchpos)&&searchpos!=null){
        ResultSet rs = storeadmin.retrieveStaffByPos(searchpos);
        while(rs.next()){%>
        <%if(rs.getInt("ID")!=1){%>
        <tr>
            <td><%=rs.getInt("ID")%></td>
            <td><%=rs.getString("FIRSTNAME")%></td>
            <td><%=rs.getString("LASTNAME")%></td>
            <td><%=rs.getString("EMAIL")%></td>
            <td><%=rs.getString("STAFFPOSITION")%></td>
            <td><%=rs.getString("ADDRESS")%></td>
            <td><%=rs.getString("STATUS")%></td>
            <td><a href="EditStaffMember.jsp?ID=<%=rs.getInt("ID")%>">Edit</a></td>
            <td><a href="DeleteStaffAction.jsp?ID=<%=rs.getInt("ID")%>">Delete</a></td>
        </tr> <%} %>
        <%}
        }
        else{
        ResultSet rs = storeadmin.retrieveAllStaff();
        while(rs.next()){%>
        <%if(rs.getInt("ID")!=1){%>
        <tr>
            <td><%=rs.getInt("ID")%></td>
            <td><%=rs.getString("FIRSTNAME")%></td>
            <td><%=rs.getString("LASTNAME")%></td>
            <td><%=rs.getString("EMAIL")%></td>
            <td><%=rs.getString("STAFFPOSITION")%></td>
            <td><%=rs.getString("ADDRESS")%></td>
            <td><%=rs.getString("STATUS")%></td>
            <td><a href="EditStaffMember.jsp?ID=<%=rs.getInt("ID")%>">Edit</a></td>
            <td><a href="DeleteStaffAction.jsp?ID=<%=rs.getInt("ID")%>">Delete</a></td>
        </tr> <%} %>
        <%}
        }
        %>
            
        </table>
        <%
            if(!"".equals(searchpos)&&searchpos!=null){%>
            <p style="text-align:center;">You are currently not viewing all staff members.
                <br>
                <a href="ViewStaffMembers.jsp">Click To View All</a>
            </p>      
            <%}
        %>
        
        <%}
        else{%>
        <p style="text-align:center;">You are not authorized to access this page.
            <br>
            <a  href="AdminLogin.jsp">Click here to login.</a>
        </p>
        
        <%}
        %>
    </body>
</html>
