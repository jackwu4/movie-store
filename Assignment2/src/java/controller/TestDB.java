
/*This stand-alone application test the connection to the db once setup in DB class
 *It performs an add-function of a Student to the database
 *To use this app, you should complete the addStudent method in DBManager class
 *
 *
 *@author George
**/
package controller;

import model.dao.*;
import Assignment2.*;
import java.sql.*;
import java.util.*;
import java.util.logging.*;
import java.time.*;
import java.time.format.DateTimeFormatter;

public class TestDB {
    private static Scanner in = new Scanner(System.in);
    
    public static void main(String[] args) {
        try {
            DBConnector connector = new DBConnector(); //Create a connection and initialize DB conn-field
            Connection conn = connector.openConnection(); //Get the protected connection instance from DB superclass to share for the application classes
            DBManager db = new DBManager(conn); //DBManger instance provide users with access to CRUD operations
            
//            System.out.print("ID");
//            int id = Integer.parseInt(in.nextLine());
//            db.deleteLog(id);
            //String email;
            //email = db.getEmail(id);
            //System.out.println(email);
            //int key = (new Random()).nextInt(999999);
            //String ID = "" + key; 
            //System.out.print("User ID:");
           // int ID = Integer.parseInt(in.nextLine());
            System.out.print("users: ");
            String table = in.nextLine();
            System.out.print("pass:");
            String pass = in.nextLine();
            System.out.println(db.findUser(table,pass).getID());
           
//            System.out.print("User password: ");
//            String password = in.nextLine();
//            LocalDateTime time = LocalDateTime.now();
//            System.out.println(time);
//            DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("dd-MM-yyyy");
//            String date =  time.format(formatDate);
//            System.out.println(date);
//            DateTimeFormatter formatTime = DateTimeFormatter.ofPattern("HH:mm:ss");
//            String currentTime = time.format(formatTime);
//            System.out.println(currentTime);
//            System.out.print("Login or logout Type");
//            
//            String type = in.nextLine();
//            
//            
//            User user = db.findUser(email, password);
//            
//            if (user != null){
//                System.out.println("Student is found in the database." + user.getID() +" " +user.getEmail());
//                
//                //String currentTime = time.format(DateTimeFormatter.ofPattern("hh:mm:ss"));
//                //System.out.println(date + " ");
//                //db.addLog(user.getID(), , type, type);
//            } 
//            
//            if(user == null){         
//            
//            db.addUser(email, password); //This method must be completed in DBManager class
//            System.out.println("Student is added to the database.");
//            connector.closeConnection(); //Professional practice is to close connection to database once operations are finalized
//            }
//            if(user != null){
//                //db.deleteStudent(ID);
//                //db.updateLog(ID,email,password,password,dob,favcol);
//            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
