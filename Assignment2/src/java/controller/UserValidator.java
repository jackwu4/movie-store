/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserValidator implements Serializable
{
    /*Starts with one capital letter, followed by one or more lower case letter.
        Then a space. Followed by zero or more word (same pattern as before)*/
    private final String firstNamePattern = "[A-Z][a-z]+([\\s][A-Z][a-z]+)*"; 
    private final String lastNamePattern = "[A-Z][a-z]+([\\s][A-Z][a-z]+)*";     
    /*The part before @, can be one or more upper case/lower case/dot/number/underscore.
        The part after @, contains at least two components separated
        by dot, each component contains upper case/lower case/hyphen*/
    private final String emailPattern = "^[A-Za-z0-9+_.-]+@(.+)$";
    /*Contains upper case/lower case/number, between 6 and 20 digits*/
    private final String passwordPattern = "[A-Za-z0-9]{6,20}";
    /*10 charaters*/
    private final String dobPattern = ".{10}";
    /*Starts with 04, followed by 8 more digits 0 to 9*/
    private final String phonePattern = "[0][4]([0-9]){8}";
    
    private final String addressPattern = ".*";
    
    public UserValidator()
    {
    }
    
    public boolean validate(String pattern, String input)
    {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }
    
    public boolean validateFirstName(String firstName)
    {        
        return validate(firstNamePattern,firstName);
    }
    public boolean validateLastName(String lastName)
    {        
        return validate(lastNamePattern,lastName);
    }
    
    public boolean validateEmail(String email)
    {                
        return validate(emailPattern,email);
    }
    
    public boolean validatePassword(String password)
    {        
        return validate(passwordPattern,password);
    }
    
    public boolean validateDob(String dob)
    {        
        return validate(dobPattern,dob);
    }
    
    public boolean validatePhone(String phone)
    {        
        return validate(phonePattern,phone);
    }
    
    public boolean validateAddress(String address)
    {        
        return validate(addressPattern,address);
    }
}
