<%-- 
    Document   : createOrder
    Created on : May 27, 2019, 6:27:30 PM
    Author     : Raymond Wong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Css.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>Create Order</title>
    </head>
    <body>
        
        
        
        
        
        
    <h1>Create Order</h1>
    
    
    


    
                    
              <form action="view.jsp" method="post">
            <table>
                <tr><td>Order ID</td><td><input size="23" type="text" name="order"></td></tr>
                <tr><td>Movie ID</td><td><input size="23" type="text" name="movie"></td></tr>
                <tr><td>Movie Name</td><td><input size="23" type="text" name="name"></td></tr>
                <tr><td>Quantity</td><td><input size="23" type="text" name="quantity"></td></tr>
                <tr><td>Date</td><td>
                <tr><td></td>
                </tr>
            </table>
              </form>
                    <div  >
                        <input class="button" type="submit" value="Submit"> 
                        &nbsp; 
                        <button class="button" type="button" onclick="location.href = 'index.jsp'" > Home Page </button>
                        &nbsp;
                        <button class="button" type="button" onclick="location.href = 'view.jsp'" > Order History </button>
                        </div>
                
        
                    
    </body>
</html>
