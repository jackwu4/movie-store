/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Assignment2;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.io.Serializable;
/**
 *
 * @author jackw
 */
public class UserTest implements Serializable{
        String email, password;

    public int getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(int loginCount) {
        this.loginCount = loginCount;
    }

    public int getLogoutCount() {
        return logoutCount;
    }

    public void setLogoutCount(int logoutCount) {
        this.logoutCount = logoutCount;
    }
        int ID;
        LocalDateTime time;
        LinkedList<LocalDateTime> login = new LinkedList<>();
        LinkedList<LocalDateTime> logout = new LinkedList<>();
        int loginCount, logoutCount;
   
        
      public UserTest(int ID,String email, String password) {
        this.email = email;
        this.password = password;
        this.ID = ID;
    }

    public UserTest() {
        time = LocalDateTime.now();
    }
    public void login(){
        addLoginTime(loginCount);
        loginCount++;
    }
    public void logout(){
        addLogoutTime(logoutCount);
        logoutCount++;
    }
    public void addLoginTime(int count){
        login.add(count,LocalDateTime.now());
    }
    public void addLogoutTime(int count){
        logout.add(count,LocalDateTime.now());
    }
    public String formatTime(LocalDateTime time){
        return time.format(DateTimeFormatter.ofPattern("hh:mm:ss"));
    }
    public LocalDateTime getLoginTime(int count){
        return login.get(count);
    }
    public LocalDateTime getLogoutTime(int count){
        return logout.get(count);
    }
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
        
    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }
}
