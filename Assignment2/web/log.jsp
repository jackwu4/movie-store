<%-- 
    Document   : log
    Created on : 16/05/2019, 1:50:20 PM
    Author     : 13599790 Chenzhi Wu
--%>
<%@page import="model.dao.*"%>
<%@page import="controller.*"%>
<%@page import="java.sql.*"%>
<%@page import="Assignment2.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>Main Page</title>
    </head>
    <%
        String log;
        User user = (User) session.getAttribute("userLogin");
        DBManager manager = (DBManager)session.getAttribute("manager");
        if (user != null) {
            
            log = " &lt " + user.getEmail() + " &gt";
        } else {
            
            log = " &lt " + "Guest" + " &gt";
        }

    %>
    <body style="background-color: white<%%>" onload="startTime()">
        <header>
        <h1 style="text-align:center; background-color: black;color: white">Online movie store</h1>
        </header>
        <div><span class="time" id="time" ></span></div>
        <h2 class="outline">User Profile</h2> 
        <table width="100%" >
            <tr bgcolor="lightgrey" ><td align="right" class="outline">You are logged in as  <%=log%></td></tr>
            <tr><td align="right">
                    <%if (user != null) { %>
                    <u><a class="link" href="management.jsp">Management</a></u> 
                        <%} else { %>
                    <u><a class="link" href="login.jsp">Register</a></u>
                        <%}%>
                    &emsp;<u><a class="link" href="logout.jsp">Logout</a></u>
                </td>
            </tr>                  
        </table>        
        <hr>
        <% if (user != null) { %>
        <form action="logAction.jsp">
        Date: <input type="date" name="date" >
        <input type="submit">
        </form>
        <form action="logActionDelete.jsp">
        Delete log ID <input type="number" name="id" min="<%=manager.getMinID("log")%>" max="<%=manager.getMaxID("log")%>">
        <input type="submit">
        </form>
        <table class="account">
            <thead class="h">
                <tr>
                    <td class="a">LogID</td>
                    <td class="a">User Email</td>
                    <td class="a">Date</td>
                    <td class="a">Time</td>
                    <td class="a">Type</td>
                </tr>
            </thead>
            <tbody >
                    <%
                        //look for logs that has the same userid as the current logged in user's id
                    String query="SELECT log.id, users.email, log.date, log.time, log.type FROM log left join users on log.userid = users.userid where users.userid =" +  user.getID();
                    Statement st=manager.getSt();
                    ResultSet rs=st.executeQuery(query);
                    while(rs.next())
                    {

                    %>
                    <tr>
                    <td><%=rs.getInt("ID") %></td>
                    <td><%=rs.getString("email") %></td>
                    <td><%=rs.getString("DATE") %></td>
                    <td><%=rs.getString("TIME") %></td>
                    <td><%=rs.getString("TYPE") %></td>
                    </tr>
                    
                    <%

                    }   
                    %>
                
            </tbody>
        </table>
        <% session.setAttribute("studentEdit", user); %>
        <%}else{ %>
        <p class="outline">Welcome Guest </p>
        <%}%>
    </body>
</html>
