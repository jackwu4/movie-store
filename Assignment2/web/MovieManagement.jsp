<%@page import="Assignment2.Movie"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.dao.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <title>Movie Details</title>
        <link rel="stylesheet" href="css/movieManagement.css">
    </head>
    <%
        DBManager manager = (DBManager) session.getAttribute("manager");
        boolean editMovie = false;
        Movie movie = new Movie();

        /*
    if the edit button was used the correspoding MOVIEID was sent.
    Using the MovieID, a movie object is made with it's data
         */
        if (request.getParameter("movieId") != null) {
            movie = manager.getMovie(Integer.valueOf(request.getParameter("movieId")));
            editMovie = true;
        }

    %>
    <body>
        <header>
            <h1>Movie Details</h1>
        </header>

        <
        <div class="content" >
            <form action="MovieManagementAction.jsp" method="post">
                <div class="detailHolder">
                    <!--
                    by checking whether the edit or add movie button was pressed
                    the movie details will already be loaded in
                    -->
                    <div class="left">
                        <label>Movie ID</label>
                        <% if (editMovie) {%>
                        <label><%= request.getParameter("movieId")%></label>
                        <input name="movieId" type="hidden" value=<%=request.getParameter("movieId")%> />
                        <%} else {%>
                        <input type="text" name="movieId"/>
                        <%}%>
                    </div><br>
                    <div class="left">
                        <label>Title</label>
                        <% String data;
                            if (editMovie) {
                                data = movie.getTitle();
                        } else {
                            data = "";
                        }%>
                        <input type="text" name="title" value="<%= data%>"/>
                    </div><br>
                    <div class="left">
                        <label>Director</label>

                        <%if (editMovie) {
                            data = movie.getDirector();
                        } else {
                            data = "";
                        }%>
                        <input type="text" name="director" value="<%= data%>"/>
                    </div><br>
                    
                    <div class="left">
                        <label>Price</label>
                        <%if (editMovie) {
                            data = movie.getPrice().toString();
                        } else {
                            data = "";
                        }%>
                        <input type="text" name="price" value="<%= data%>"/>
                    </div><br>
                    
                    <div class="left">
                        <label>Genre</label>
                        <%if (editMovie) {
                            data = movie.getGenre();
                        } else {
                            data = "";
                        }%>
                        <input type="text" name="genre" value="<%= data%>"/>
                    </div><br>
                    
                    <div class="left">
                        <label>Rating</label>
                        <%if (editMovie) {
                            data = Integer.toString(movie.getRating());
                        } else {
                            data = "";
                        }%>
                        <input type="text" name="rating" value="<%= data%>"/>
                    </div><br>
                    
                    <div class="left">
                        <label>Release Date</label>
                        <%if (editMovie) {
                            data = movie.getReleaseDate().toString();
                        } else {
                            data = "";
                        }%>
                        <input type="text" name="releaseDate" placeholder="yyyy-mm-dd" value="<%= data%>"/>
                    </div><br>
                    
                    <div class="left">
                        <label>Stock</label>
                        <%if (editMovie) {
                            data = Integer.toString(movie.getStock());
                        } else {
                            data = "";
                        }%>
                        <input type="text" name="stock" value="<%= data%>"/>
                    </div><br>
                    
                    <div class="left">
                        <label>Movie Length</label>
                        <%if (editMovie) {
                            data = Integer.toString(movie.getMovieLength());
                        } else {
                            data = "";
                        }%>
                        <input type="text" name="movieLength" value="<%= data%>"/>
                    </div><br>

                </div>
                    
                    <!--
                    A hidden value to know whether an update or new movie is required
                    -->
                <input type="hidden" name="editMovie" value=<%=editMovie%> />
                <%  //depending on an edit or new movie the text of the buttons at the bottom 
                    //of the screen will change.
                    String buttonString;
                    if (editMovie) {
                        buttonString = "Edit";
                    } else {
                        buttonString = "Add Movie";
                    }%>
                <input type="submit" class="addMovie" value=<%=buttonString%> />
            </form>
            
            <!--The delete button that will only show when editing the movie -->
            <% if (editMovie) {%>
            <form action="MovieManagementAction.jsp" method="post">
                <input type="hidden" name="deleteMovie" value=<%= movie.getMovieID()%> />
                <input type="submit" class="removeMovie" value="Delete">
            </form>

            <%}%>
            <!--the return button to the catalogue -->
            <a href="Catalogue.jsp"><button  class="back" action="Catalogue.jsp">Back</button></a>        
        </div>
    </body>

</html>