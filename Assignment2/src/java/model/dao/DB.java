package model.dao;

import java.sql.Connection;

/**
 * Super class of DAO classes that manager connection and operation with the database
 * @author George
 */
public abstract class DB {
    protected String URL = "jdbc:derby://localhost:1527/MovieDB2";//replace empty-string with jdbc:derby local host url
    protected String db = "MovieDB2";//name of the database
    protected String dbuser = "MovieDB2";//db root user
    protected String dbpass = "MovieDB2"; //db root password
    protected String driver = "org.apache.derby.jdbc.ClientDriver"; //jdbc client driver - built in with NetBeans
    protected Connection conn; //connection null-instance to be initialized in sub-classes
}
