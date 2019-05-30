
package Assignment2;
import java.io.Serializable;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
public class User implements Serializable
{

    
   private int id;
   private String email;
   private String password;
   private String firstName;
   private String lastName;
   private String address;
   private String dob;
   private char gender;
   private String phone;
   private String usertype;



    public User()
    {
    }

    public User(int id, String email, String password) {
        this.id = id;
        this.email = email;
        this.password = password;
    }

    public User( int id, String email, String password,String firstName,String lastName, String address, String dob, char gender, String phone,String usertype)
    {
        this.id = id;
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.phone = phone;
        this.usertype = usertype;
        
        
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
    public int getID() {
        return id;
    }
    
    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
      }

    public String getFirstName()
    {
        return firstName;
    }

    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }
    public String getLastName()
    {
         return lastName;
    }

    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }
    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }
    public String getDob()
    {
        return dob;
    }

    public void setDob(String dob)
    {
        this.dob = dob;
    }
    public char getGender()
    {
        return gender;
    }

    public void setGender(char gender)
    {
        this.gender = gender;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getUsertype() {
        return usertype;
    } 

    public void updateUser( int id, String email, String password,String firstName,String lastName, String address, String dob, char gender, String phone,String usertype)
    {
        this.id = id;
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.phone = phone;
        this.usertype = usertype;
    }
}
