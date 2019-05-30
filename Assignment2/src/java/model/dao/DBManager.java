package model.dao;

import Assignment2.*;
import java.sql.*;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * 13599790 Chenzhi Wu
 */
public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    //Find student by ID in the database
//   public String getEmail(int id) throws SQLException {
//       String searchQueryString = "select * from Users where ID=" + id ;
//       ResultSet rs = st.executeQuery(searchQueryString);
//       boolean hasUser = rs.next();
//       String email = null;
//       
//       if(hasUser){
//       
//       email = rs.getString("EMAIL");
//       }
//       
//       return email;
//   }
    //find and return user
    public User findUser(String email, String password) throws SQLException {
        //setup the select sql query string
        //execute this query using the statement field
        //add the results to a ResultSet
        //search the ResultSet for a student using the parameters
        System.out.println(email + " " + password);
        String searchQueryString = "select * from USERS where EMAIL='" + email + "' AND PASSWORD ='" + password + "' ";
        //String searchQueryString = "select * from Customer ";
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(searchQueryString);
        //search the ResultSet for a student using the parameters
        boolean hasUser = rs.next();
        User userFromDB = null;

        if (hasUser) {
            int sID = rs.getInt("userID");
            String sPassword = rs.getString("password");
            String sEmail = rs.getString("email");
//                String sName = rs.getString("name");
//                String sDOB = rs.getString("dob");
//                String sFavcolor = rs.getString("favoritecolor");

            userFromDB = new User(sID, sEmail, sPassword);

        }

        rs.close();
        return userFromDB;
    }

    //login function, add a log when user logs in
    public void login(int userID) throws SQLException {
        //code for add-operation
        String type = "Login";
        LocalDateTime current = LocalDateTime.now();
        DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String date = current.format(formatDate);
        DateTimeFormatter formatTime = DateTimeFormatter.ofPattern("HH:mm:ss");
        String time = current.format(formatTime);
        String createQueryString = "insert into Log (userid,date,time,type) values (" + userID + ", '" + date + "', '" + time + "', '" + type + "')";
        boolean recordCreated = st.executeUpdate(createQueryString) > 0;

        if (recordCreated) {
            System.out.println("Record Created");
        } else {
            System.out.println("Record not updated");
        }
    }

    //logout function, add a log when user logs out
    public void logout(int userID) throws SQLException {
        //code for add-operation
        String type = "Logout";
        LocalDateTime current = LocalDateTime.now();
        DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String date = current.format(formatDate);
        DateTimeFormatter formatTime = DateTimeFormatter.ofPattern("HH:mm:ss");
        String time = current.format(formatTime);
        String createQueryString = "insert into Log (userid,date,time,type) values (" + userID + ", '" + date + "', '" + time + "', '" + type + "')";
        boolean recordCreated = st.executeUpdate(createQueryString) > 0;

        if (recordCreated) {
            System.out.println("Record Created");
        } else {
            System.out.println("Record not updated");
        }
    }

    //delete a log from the database
    public void deleteLog(int logID) throws SQLException {
        //code for delete-operation
        String deleteQueryString = "delete from Log where ID= " + logID;
        boolean recordDeleted = st.executeUpdate(deleteQueryString) > 0;

        if (recordDeleted) {
            System.out.println("record deleted");

        } else {
            System.out.println("record not created");
        }

    }

    //return the lowest logID
    public int getMinID(String table) throws SQLException {
        String searchQueryString = "select * from " + table + " where ID = (select MIN(id) from " + table + ")";
        ResultSet rs = st.executeQuery(searchQueryString);
        boolean hasID = rs.next();
        int id = -1;

        if (hasID) {

            id = rs.getInt("ID");
        }

        return id;
    }

    //return the highest logID
    public int getMaxID(String table) throws SQLException {
        String searchQueryString = "select * from " + table + " where ID = (select MAX(id) from " + table + ")";
        ResultSet rs = st.executeQuery(searchQueryString);
        boolean hasID = rs.next();
        int id = -1;

        if (hasID) {

            id = rs.getInt("ID");
        }

        return id;
    }

    //return the current statement so that it can be used directly in JSP
    public Statement getSt() {
        return st;
    }

    //Xiaohan Wang
    //Add a Customer-data into the database
    public void addCustomer(int ID, String firstName, String lastName, String address, String dob, char gender, String phone) throws SQLException {
        //code for add-operation
        // combine two tables.
        String createQueryString = "insert into Customer (customerid, firstname, lastname, address, gender, dateofbirth, phone)" + " values (" + ID + ", '" + firstName + "', '" + lastName + "', '" + address + "', '" + gender + "', '" + dob + "', '" + phone + "' )";
        boolean recordCreated = st.executeUpdate(createQueryString) > 0;

        if (recordCreated) {
            System.out.println("Record Created");
        } else {
            System.out.println("Record not updated");
        }
    }
    //Add a User-data into the database

    public void addUser(int userid, String usertype, String email, String password) throws SQLException {
        String createQueryString = "insert into Users (userid, usertype, email, password)" + " values (" + userid + ", '" + usertype.charAt(0) + "', '" + email + "', '" + password + "' )";
        boolean recordCreated = st.executeUpdate(createQueryString) > 0;

        if (recordCreated) {
            System.out.println("Record Created");
        } else {
            System.out.println("Record not updated");
        }

    }

    public void updateCustomer(int ID, String firstName, String lastName, String address, String dob, String gender, String phone) throws SQLException {
        //code for update-operation
        String updateQueryString = "update Customer set firstname = '" + firstName + "' , lastname = '" + lastName + "' , address = '" + address + "' , dateofbirth = '" + dob + "' , gender = '" + gender.charAt(0) + "' , phone = '" + phone + "' where customerid = " + ID;
        boolean recordUpdated = st.executeUpdate(updateQueryString) > 0;
        if (recordUpdated) {
            System.out.println("record updated");
        } else {
            System.out.println("record not updated");
        }
    }

    //update a user details in the database
    public void updateUser(int userid, String usertype, String email, String password) throws SQLException {
        String updateQueryString = "update Users set email = '" + email + "' , password = '" + password + "' where userid = " + userid;
        boolean recordUpdated = st.executeUpdate(updateQueryString) > 0;
        if (recordUpdated) {
            System.out.println("record updated");
        } else {
            System.out.println("record not updated");
        }

    }

    public User findUser(String email) throws SQLException {  // get the user information from data according to the "email"
        //setup the select sql query string
        String searchQueryString = "select * from Customer left join Users on Customer.Customerid = Users.Userid where Email='" + email + "'";
        //execute this query using the statement field
        ResultSet rs = st.executeQuery(searchQueryString);
        //search the ResultSet for a user using the parameters

        boolean hasUser = rs.next();
        User userFromDB = null;
        if (hasUser) {
            int sID = rs.getInt("userid");
            String sPassword = rs.getString("password");
            String sEmail = rs.getString("email");
            String sUserType = rs.getString("usertype");

            String sFirstName = rs.getString("firstname");
            String sLastName = rs.getString("lastname");

            String sAddress = rs.getString("address");
            String sDOB = rs.getString("dateofbirth");
            String sGender = rs.getString("gender");
            String sPhone = rs.getString("phone");

            userFromDB = new User(sID, sEmail, sPassword, sFirstName, sLastName, sAddress, sDOB, sGender.charAt(0), sPhone, sUserType);
        }
        rs.close();
        return userFromDB;
    }

    public void deleteCustomer(int ID) throws SQLException {
        //code for delete-operation
        String deleteQueryString = "delete from Customer where customerid= " + ID;
        boolean recordDeleted = st.executeUpdate(deleteQueryString) > 0;

        if (recordDeleted) {
            System.out.println("record deleted");

        } else {
            System.out.println("record not created");
        }

    }
    //delete a user from the database

    public void deleteUser(int ID) throws SQLException {
        //code for delete-operation
        String deleteQueryString = "delete from Users where userid= " + ID;
        boolean recordDeleted = st.executeUpdate(deleteQueryString) > 0;

        if (recordDeleted) {
            System.out.println("record deleted");

        } else {
            System.out.println("record not created");
        }

    }

    //Kevin
    public void addStaff(String firstname, String lastname, String email, String staffpos, String address, String status, String password) throws SQLException {

        String createQueryString = "insert into Staff(firstname, lastname, email, staffposition, address, status, password)" + " values ('" + firstname + "', '" + lastname + "', '" + email + "', '" + staffpos + "', '" + address + "', '" + status + "' , '" + password + "')";
        boolean recordCreated = st.executeUpdate(createQueryString) > 0;

        if (recordCreated) {
            System.out.println("Record Created");
        } else {
            System.out.println("Record not updated");
        }
    }

    public Staff findStaff(String email, String password) throws SQLException {

        System.out.println(email + " " + password);
        String searchQueryString = "select * from Staff where EMAIL='" + email + "' AND PASSWORD ='" + password + "' ";

        ResultSet rs = st.executeQuery(searchQueryString);
        boolean hasStaff = rs.next();
        Staff staffFromDB = null;

        if (hasStaff) {
            String sFirstName = rs.getString("firstname");
            String sLastName = rs.getString("lastname");
            String sEmail = rs.getString("email");
            String sPosition = rs.getString("staffposition");
            String sAddress = rs.getString("address");
            String sStatus = rs.getString("status");
            String sPassword = rs.getString("password");

            staffFromDB = new Staff(sFirstName, sLastName, sEmail, sPosition, sAddress, sStatus, sPassword);

        }

        rs.close();
        return staffFromDB;
    }

    public Staff findStaffByID(int ID) throws SQLException {

        System.out.println(ID);
        String searchQueryString = "select * from Staff where ID=" + ID;

        ResultSet rs = st.executeQuery(searchQueryString);
        boolean hasStaff = rs.next();
        Staff staffFromDB = null;

        if (hasStaff) {
            String sFirstName = rs.getString("firstname");
            String sLastName = rs.getString("lastname");
            String sEmail = rs.getString("email");
            String sPosition = rs.getString("staffposition");
            String sAddress = rs.getString("address");
            String sStatus = rs.getString("status");
            String sPassword = rs.getString("password");

            staffFromDB = new Staff(sFirstName, sLastName, sEmail, sPosition, sAddress, sStatus, sPassword);

        }

        rs.close();
        return staffFromDB;
    }

    public ResultSet retrieveStaffByPos(String pos) throws SQLException {

        System.out.println(pos);
        String searchQueryString = "select * from Staff where staffposition='" + pos + "'";
        return st.executeQuery(searchQueryString);
    }

    public ResultSet retrieveAllStaff() throws SQLException {
        return st.executeQuery("select * from staff");
    }

    public void deleteStaff(int ID) throws SQLException {

        String deleteQueryString = "delete from Staff where ID= " + ID;
        boolean recordDeleted = st.executeUpdate(deleteQueryString) > 0;

        if (recordDeleted) {
            System.out.println("record deleted");

        } else {
            System.out.println("record not created");
        }

    }

    public void updateStaff(int ID, String firstname, String lastname, String email, String staffpos, String address, String status, String password) throws SQLException {

        String updateQueryString = "update Staff set firstname = '" + firstname + "' , lastname = '" + lastname + "' , email = '" + email + "' , staffposition = '" + staffpos + "' , address = '" + address + "' , status = '" + status
                + "' , password = '" + password + "' where ID = " + ID;
        boolean recordUpdated = st.executeUpdate(updateQueryString) > 0;
        if (recordUpdated) {
            System.out.println("record updated");
        } else {
            System.out.println("record not updated");
        }
    }

    /*
    Code for Catalogue management
    -Winston Chenn
    
    addMovie will first check if there is a MovieID to enter and whether it already exists
    it will then go through and check for empty values and convert them to 0 for the database
    finally it will then add the movie to the database
    */
    public void addMovie(String movieId, String title, String director, String price, String genre, String rating, String releaseDate, String stock, String movieLength) throws SQLException {
        if (!movieId.equals("") && !movieExists(Integer.parseInt(movieId))) {
            if (price.equals("")) {
                price = "0";
            }
            if (rating.equals("")) {
                rating = "0";
            }
            if (stock.equals("")) {
                stock = "0";
            }
            if (releaseDate.equals("")) {
                releaseDate = "2000-01-01";
            }
            if (movieLength.equals("")) {
                movieLength = "0";
            }
            st.execute("INSERT INTO MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) "
                    + "VALUES (" + movieId + ",'" + title + "','" + director + "'," + price + ",'" + genre + "'," + rating + ",'" + releaseDate + "'," + stock + "," + movieLength + ")");
        }

    }

    public ResultSet getAllMovies() throws SQLException {
        return st.executeQuery("SELECT * FROM MOVIE");
    }

    public void removeMovie(int movieID) throws SQLException {
        st.execute("DELETE FROM MOVIE WHERE MOVIEID=" + movieID);
    }
    //will fill in any empty values with 0 then update the record
    public void updateMovie(String movieId, String title, String director, String price, String genre, String rating, String releaseDate, String stock, String movieLength) throws SQLException {
        if (price.equals("")) {
            price = "0";
        }
        if (rating.equals("")) {
            rating = "0";
        }
        if (stock.equals("")) {
            stock = "0";
        }
        if (releaseDate.equals("")) {
            releaseDate = "2000-01-01";
        }
        if (movieLength.equals("")) {
            movieLength = "0";
        }

        st.execute("UPDATE MOVIE SET TITLE='" + title + "', DIRECTOR='" + director + "', PRICE=" + price + ", GENRE='" + genre + "', RATING=" + rating + ", " + "RELEASEDATE='" + releaseDate + "', STOCK=" + stock + ", MOVIELENGTH=" + movieLength + " WHERE MOVIEID =" + movieId);

    }
    //searches for the desired string,for any genres it will attach the corresponding sql
    public ResultSet searchMovies(String search, ArrayList<String> genres) throws SQLException {
        String query = "SELECT * FROM MOVIE WHERE TITLE LIKE '%" + search + "%'";
        if (!genres.isEmpty()) {
            for (int i = 0; i < genres.size(); i++) {
                query = query + " AND GENRE='" + genres.get(i) + "'";
            }
        }
        return st.executeQuery(query);
    }
    
    //finds the movie in the database through it's ID, creates a new Movie Object and fills 
    //it in with the corresponding data
    public Movie getMovie(int movieId) throws SQLException {
        ResultSet resSet = st.executeQuery("SELECT * FROM MOVIE WHERE MOVIEID =" + movieId);
        Movie movie = new Movie();
        while (resSet.next()) {
            movie.setMovieID(resSet.getInt("MOVIEID"));
            movie.setTitle(resSet.getString("TITLE"));
            movie.setDirector(resSet.getString("DIRECTOR"));
            movie.setPrice(resSet.getDouble("PRICE"));
            movie.setGenre(resSet.getString("GENRE"));
            movie.setRating(resSet.getInt("RATING"));
            movie.setReleaseDate(resSet.getDate("RELEASEDATE"));
            movie.setStock(resSet.getInt("STOCK"));
            movie.setMovieLength(resSet.getInt("MOVIELENGTH"));
        }
        return movie;
    }
    
    public boolean movieExists(int movieId) throws SQLException {
        ResultSet resSet = st.executeQuery("SELECT * FROM MOVIE WHERE MOVIEID =" + movieId);
        while (resSet.next()) {
            return movieId == resSet.getInt("MOVIEID");
        }
        return false;
    }

    public ResultSet getGenres() throws SQLException {
        return st.executeQuery("SELECT DISTINCT GENRE FROM MOVIE");
    }

}
