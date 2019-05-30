<%-- 
    Document   : addMovie
    Created on : 30/05/2019, 2:28:06 PM
    Author     : Laptop
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.dao.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catalogue</title>
    </head>
    <%
        DBManager manager = (DBManager) session.getAttribute("manager");

        try {
            //will check if the edit or add button was pressed then retrieves all the values
            //and sends them to the manager to add or edit the database
            if (request.getParameter("editMovie") != null) {
                if (request.getParameter("editMovie").toString().contains("true")) {
                    manager.updateMovie(request.getParameter("movieId"), request.getParameter("title"),
                            request.getParameter("director"), request.getParameter("price"),
                            request.getParameter("genre"), request.getParameter("rating"),
                            request.getParameter("releaseDate"), request.getParameter("stock"),
                            request.getParameter("movieLength"));

                } else if (request.getParameter("editMovie").toString().contains("false")) {
                    manager.addMovie(request.getParameter("movieId"), request.getParameter("title"),
                            request.getParameter("director"), request.getParameter("price"),
                            request.getParameter("genre"), request.getParameter("rating"),
                            request.getParameter("releaseDate"), request.getParameter("stock"),
                            request.getParameter("movieLength"));
                }
            }
            //if the delete button was pressed, which only shows on an editing movie,
            //it will retrieve the movie id and delete it
            if (request.getParameter("deleteMovie") != null) {
                manager.removeMovie(Integer.parseInt(request.getParameter("deleteMovie")));
            }

        } catch (SQLException e) {
            response.sendRedirect("Catalogue.jsp");
        }
        response.sendRedirect("Catalogue.jsp");

    %>
    <body>
    </body>
</html>
