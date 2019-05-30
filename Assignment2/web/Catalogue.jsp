<%-- 
    Document   : Catalogue
    Created on : 20/05/2019, 1:00:59 AM
    Author     : Winston
--%>

<%@page import="java.util.Map"%>
<%@page import="Assignment2.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>  
<%@page import="java.sql.ResultSet.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catalogue Management</title>
        <link rel="stylesheet" href="css/catalogue.css">
    </head>
    <%
        DBManager manager = (DBManager) session.getAttribute("manager");

        //makes a list of all the unique genres used
        ArrayList<String> genres = new ArrayList<String>();
        ResultSet resSetGenre = manager.getGenres();
        while (resSetGenre.next()) {
            genres.add(resSetGenre.getString("GENRE"));
        }

        ResultSet resSet = manager.getAllMovies();

        //searches the Movies and genres that was searched in the searchbar
        //it loops through all the genres that was posted and adds them to an list for the sql
        if (request.getParameter("search") != null) {
            ArrayList<String> searchGenres = new ArrayList<String>();
            for (int i = 0; i < genres.size(); i++) {
                String s = request.getParameter(Integer.toString(i));
                if (s != null) {
                    searchGenres.add(genres.get(i));
                }
            }
            resSet = manager.searchMovies(request.getParameter("search"), searchGenres);
        }
        
        //converts all the searched results or the entire movie database into a 
        //list of movie objects
        ArrayList<Movie> movies = new ArrayList<Movie>();
        while (resSet.next()) {
            movies.add(new Movie(resSet.getInt("MOVIEID"), resSet.getString("TITLE"),
                    resSet.getString("DIRECTOR"), resSet.getDouble("PRICE"), resSet.getString("GENRE"),
                    resSet.getInt("RATING"), resSet.getDate("RELEASEDATE"), resSet.getInt("STOCK"),
                    resSet.getInt("MOVIELENGTH")));
        }

    %>
    <body>
        <header>
            <h1>Catalogue Management</h1>
        </header>


        <div class="content">
            <div class="searchBar">
                <form action="Catalogue.jsp" method="post">
                    <input class="search" type="search" name="search" placeholder="Search for a Movie">



                    <div class="genreDropdown">Genres
                        <div class="genreDropDownContent">
                            
                            <% //loops through all the unique genres in the database 
                                //and makes a corresponding checkbox for each one
                                for (int i = 0; i < genres.size(); i++) {%>
                            <input type="checkbox" name="<%=i%>" > <%= genres.get(i)%><br>
                            <%}%>
                        </div>
                    </div>

                    <input type="submit" class="searchButton" value="Search"/>
                </form>
            </div>

            <div class="movieDiv">
                <table>
                    <tr>
                        <th class="movieId">MovieID</th>
                        <th class="title">Title</th>
                        <th class="price">Price</th>
                        <th class="genre">Genre</th>
                        <th class="quantity">Qty</th>
                        <th class="edit">Edit</th>
                    </tr>
                    <%  //makes a new row for each movie in the list of movies to display
                        for (int i = 0; i < movies.size(); i++) {%>
                    <tr>
                        <td class="movieId"><%= movies.get(i).getMovieID()%></td>
                        <td class="title"><%= movies.get(i).getTitle()%></td>
                        <td class="price"><%=movies.get(i).getPrice()%></td>
                        <td class="genre"><%=movies.get(i).getGenre()%></td>
                        <td class="quantity"><%=movies.get(i).getStock()%></td>
                        <td class="edit">
                            <form action="MovieManagement.jsp" method="post">
                                <input type="hidden" value="<%=movies.get(i).getMovieID()%>" name="movieId"/>
                                <input type="submit" class="editButton" value="Edit"/>
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </table>
            </div>
            <button class="back" onclick="location.href = 'management.jsp'">Back</button>
            <form action="MovieManagement.jsp">
                <input type="submit" value="Add Movie" class="addMovie">

            </form>
        </div>
    </body>
</html>