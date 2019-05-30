<%-- 
    Document   : View Order
    Created on : May 17, 2019, 2:43:19 PM
    Author     : tiger
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Css.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>View Order</title>
    </head>
    <body>
    <h1>My Orders</h1>
    
    Date: <input type="date" name="dob" <br>
   
     <div class="search-container">
    <form action="">
      <input type="text" placeholder="Search.." name="search">
      <button type="submit">Search</button>
    </form>
  </div>
    
    
    
    
         
    <%
        String order = request.getParameter("order");
        String movie = request.getParameter("movie");
        String name = request.getParameter("name");
        String quantity = request.getParameter("quantity");
        String date = request.getParameter("date");
    %>
    
    <table class="movie">
            <thead class="h">
                <tr>
                    <td>Order ID</td>
                    <td>Movie ID</td>
                    <td>Movie</td>
                    <td>Quantity</td>
                    <td>Date</td>
                    
                </tr>
            </thead>
            <tbody >
                <tr>
                    <td class="a"><%=order%></td>
                    <td class="a"><%=movie%></td>
                    <td class="a"><%=name%></td>
                    <td class="a"><%=quantity%></td>
                    <td class="a"><%=date%></td>
                    
                    
                </tr>
            </tbody>
        </table>   
    
     
        
<div >
    <button class="button" type="button" value="cancel" onclick="location.href = 'management.jsp'"> Go back </button>
    <button class="button" type="button" value="Order" onclick="location.href = 'createOrder.jsp'"> Create Order </button>
</div>
                      

    </body>
</html>

