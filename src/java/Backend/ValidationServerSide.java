/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author vaish
 */
public class ValidationServerSide {
    private Pattern firstname;
    private Pattern lastname;
    private Pattern email;
    private Pattern password;
    
    private Matcher matcher;
    
    private final static String FIRSTNAMEPATTERN="^[a-zA-Z]{3,30}$";
    private final static String LASTNAMEPATTERN="^[a-zA-Z]{3,30}$";
    private final static String EMAILPATTERN="^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$";
    private final static String PASSWORDPATTERN="^[A-Za-z0-9@#_]{6,16}$";
    
    public ValidationServerSide(){
        firstname = Pattern.compile(FIRSTNAMEPATTERN);
        lastname = Pattern.compile(LASTNAMEPATTERN);
        email = Pattern.compile(EMAILPATTERN);
        password = Pattern.compile(PASSWORDPATTERN);
    }
    
    public boolean firstValidate(final String first1){
        matcher = firstname.matcher(first1);
        return matcher.matches();
    }
    
    public boolean lastValidate(final String last1){
        matcher = lastname.matcher(last1);
        return matcher.matches();
    }
    
    public boolean emailValidate(final String email1){
        matcher = email.matcher(email1);
        return matcher.matches();
    }
    
    public boolean passwordValidate(final String password1){
        matcher = password.matcher(password1);
        return matcher.matches();
    }
}
