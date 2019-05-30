<%-- 
    Document   : login
    Created on : 13/04/2019, 11:45:24 AM
    Author     : 13599790 Chenzhi Wu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
        <h1 style="text-align:center; background-color: black;color: white">Online movie store</h1>
        </header>
        
        <form action="loginAction.jsp" method="POST">
        <table align="center">
            <tr>
                <th>Email: </th>
                <th><input type="text" name="email"></th>
            </tr>
            <tr>
                <th>Password: </th>
                <th><input type="password" name="password"></th>
            </tr>
            <tr>
                <th colspan="2"><input type="submit" name="Submit"></th>
            </tr>
            <tr><th colspan="2"><button class="button" type="button" onclick="location.href = 'index.jsp'" > Home Page </button></th></tr>
        </table>
        </form>
        
    </body>
</html>
