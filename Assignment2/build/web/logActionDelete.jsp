<%-- 
    Document   : logActionDelete
    
    Author     : 13599790 Chenzhi Wu
--%>

<%@page import="model.dao.*"%>
<%@page import="controller.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Assignment2.*" %>
<%@page import="java.time.*" %>
<%@page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Action Page</title>
    </head>
    <body>

        <%
            //Activate the database search-validate once DBManager functions are completed
            DBManager manager = (DBManager)session.getAttribute("manager");
            
            String id = request.getParameter("id");

            //User user = new User();
            //user.setEmail(email);
            //user.setPassword(password);
            //user.login();
            
            
            manager.deleteLog(Integer.parseInt(id));
            response.sendRedirect("log.jsp");                        
           
            
                      
        %>
        
    </body>
</html>
