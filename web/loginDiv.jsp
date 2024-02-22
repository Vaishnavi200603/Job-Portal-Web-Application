<%-- 
    Document   : loginDiv
    Created on : 11-Feb-2024, 6:55:48 pm
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
    </head>
    <body>
        <div class="row" style="background-color: #c2cacc"> 
            <div class="col-md-4">
                
            </div>
            <div class="col-md-8"> 
                <form method="POST" action="login"> 
                    <div class="form-box">
                        <div class="login-container" id="login">
                            <div class="top"> 
                                <span> Don't Have An Account? <a href="register.jsp"> Register </a> </span>
                                <header class="head"> LOGIN </header>
                            </div>
                            <div class="input-box">
                                <input type="text" class="input-feilds" placeholder="Username or Email" name="email1"> <br><br>
                            </div>
                            <div class="input-box">
                                <input type="password" class="input-feilds" placeholder="Password" name="pass1"> <br><br>
                            </div>
                            <div class="input-box"> 
                                <input type="submit" class="submit  btn btn-primary" value="Sign-In">
                            </div>

                            <div class="two-col"> 
                                <div class="one">
                                    <input type="checkbox" id="login-check" name="remember1">
                                    <label for="login-check" > REMEMBER ME </label>      
                                </div>
                                <div class="two"> 
                                    <label><a href="#"> Forgot Password? </a> </label>
                                </div>
                            </div>
                        </div> 
                    </div>
                </form>
                
            </div>
            
            <div class="col-md-4">  
            
            </div>
        </div>
    </body>
</html>
