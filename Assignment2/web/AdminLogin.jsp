
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ page import="Assignment2.Staff" %>
    <%@ page import="model.dao.*"%>
    <%@ page import="model.*" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admin.css"> 
        <title>Login</title>
    </head>
    <body>
        <h1 style="text-align:center; background-color: black;color: white">Online movie store</h1>
        <h2 style="text-align:center;">Administration Login</h2>
        <p style="text-align:center;">
        <h4>Enter your details to login:</h4>
        <%if(null!=session.getAttribute("loginErr")){%><h5 class="err">Account Information Incorrect Or Is Not An Active Admin</h5><%}%>
        <form style="margin: 0 auto; width: 250px;" action="AdminLoginAction.jsp" method="post">
            <table>                
                <tr><td>Staff Email:</td><td><input type="text" name="email"></td></tr>
                <tr><td>Password:</td><td><input type="password" name="password"></td></tr>                
                <tr><td></td>
                    <td><input type="submit" value="Login"> 
                        &nbsp; 
                        <button class="button" type="button" onclick="location.href = 'index.jsp'" > Home Page </button>
                    </td>
                </tr>
            </table>
        </form>
        ${loginErr=null}
    </p>
     <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
