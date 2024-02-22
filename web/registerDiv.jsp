<%-- 
    Document   : registerDiv
    Created on : 12-Feb-2024, 12:08:03 am
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login div Page</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
       
        <link rel="stylesheet" type="text/css" href="CSS/style.css"/>
        
        <script>
            function validation(){
               var first2= document.regForm.first1.value;
               var last2= document.regForm.last1.value;
               var email2= document.regForm.email1.value;
               var pass2= document.regForm.pass1.value;
               var gender2= document.regForm.gender1.value;
               //var feilds2= document.regForm.feilds1.value;
               var city2= document.regForm.city1.value;
               
               var firstPattern = /^[a-zA-Z]{3,30}$/;
               var lastPattern = /^[a-zA-Z]{3,30}$/;
               var emailPattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
               var passwordPattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
//               var phonePattern = /^[0-9]{10}$/;
           
                if(first2 === ""){
                    alert("First Name cannot be Empty");
                    return false;
                }
                else if(!first2.match(firstPattern)){
                    alert("Name Is Not Properly Formatted");
                    return false;
                }
                else if(last2 === ""){
                    alert("Last Name cannot be Empty");
                    return false;
                }
                else if(!last2.match(lastPattern)){
                    alert("Name Is Not Properly Formatted");
                    return false;
                }
                else if(email2 === ""){
                    alert("Email cannot be Empty");
                    return false;
                }
                else if(!email2.match(emailPattern)){
                    alert("Email Is Not Properly Formatted");
                    return false;
                }
                else if(pass2 === ""){
                    alert("Please Provide password");
                    return false;
                }
                else if(!pass2.match(passwordPattern)){
                    alert("Password Is Not Properly Formatted");
                    return false;
                }
                else if(gender2 === ""){
                    alert("Please Select Gender");
                    return false;
                }

                else if(city2 === "Your City"){
                    alert("Please Select City");
                    return false;
                }
                else{
                    document.regForm.action="reg";
                    document.regForm.submit();
                }
            }
        </script>
    </head>
    <body>
        <div class="row" style="background-color: #c2cacc"> 
            <div class="col-md-4">
                
            </div>
            <div class="col-md-8">  
                <form method="POST" name="regForm" onsubmit="return validation()"> 
                    <div class="form-box">
                        <div class="register-container" id="register">
                            <div class="top"> 
                                <span> Have An Account? <a href="login.jsp"> LOGIN </a> </span>
                                <header class="head"> SIGN UP </header>
                            </div>
                            <div class="two-forms">
                                <div class="input-box">
                                    <input type="text" class="input-feilds" placeholder="First Name" name="first1"> <br><br>
                                </div>

                                <div class="input-box">
                                    <input type="text" class="input-feilds" placeholder="Last Name" name="last1"> <br><br>
                                </div>
                            </div>
                            <div class="input-box">
                                <input type="text" class="input-feilds" placeholder="Email" name="email1"> <br><br>
                            </div>
                            <div class="input-box">
                                <input type="password" class="input-feilds" placeholder="Password" name="pass1"> <br><br>
                            </div>
                            <div class="other-info-box"> 
                                Select Gender: 
                                <input type="radio" name="gender1" value="Male"/> Male
                                <input type="radio" name="gender1" value="Female"/> Female
                                <br> <br>

                                Select Feilds:
                                <input type="checkbox" name="feilds1" value="IT"/> IT
                                <input type="checkbox" name="feilds1" value="Marketing"/> Marketing
                                <input type="checkbox" name="feilds1" value="Finance"/> Finance
                                <br> <br>

                                <select name="city1" class="input-feilds">
                                    <option> Your City </option>
                                    <option value="Bangalore"> Bangalore </option>
                                    <option value="Delhi"> Delhi </option>
                                    <option value="Mumbai"> Mumbai </option>
                                    <option value="Pune"> Pune </option>
                                    <option value="Jaipur"> Jaipur </option>
                                    <option value="Hyderabad"> Hyderabad </option>
                                </select>
                                
                                <br> <br>
                            </div>
                            <div class="input-box"> 
                                <input type="submit" class="submit btn btn-primary" value="Register">
                            </div>

                            <div class="two-col"> 
                                <div class="one">
                                    <input type="checkbox" id="register-check">
                                    <label for="register-check"> REMEMBER ME </label>      
                                </div>
                                <div class="two"> 
                                    <label><a href="#"> Terms & Conditions </a> </label>
                                </div>
                            </div>
                        </div> 
                    </div>
                </form>
            </div>
                
            </div>
            
            <div class="col-md-4">  
            
            </div>
        </div>
    </body>
</html>
