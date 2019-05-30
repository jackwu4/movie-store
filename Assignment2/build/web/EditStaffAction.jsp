<%-- 
    Document   : EditStaffAction
    Created on : 29-May-2019, 01:03:56
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
        <title>Administration</title>
    </head>
    <% 
       try{
       int ID = Integer.parseInt(request.getParameter("eID"));
       System.out.println("ID "+ID+" obtained");
       String firstname = request.getParameter("firstname");
       String lastname = request.getParameter("lastname");
       String email = request.getParameter("email");
       String position = request.getParameter("staffpos");
       String address = request.getParameter("address");
       String status = request.getParameter("status");
       String password = request.getParameter("password");
       DBManager storeadmin = (DBManager)session.getAttribute("manager");
       Staff staff = new Staff(firstname,lastname,email,position,address,status,password);
       storeadmin.updateStaff(ID,firstname,lastname,email,position,address,status,password);
       response.sendRedirect("ViewStaffMembers.jsp");}
       catch(NumberFormatException e){
       response.sendRedirect("ViewStaffMembers.jsp");
       }
    %>
    <body>
        <h1></h1>
    </body>
    <jsp:include page="/ConnServlet" flush="true" />
</html>