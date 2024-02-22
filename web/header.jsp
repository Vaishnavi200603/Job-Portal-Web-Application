<%-- 
    Document   : header.jsp
    Created on : 11-Feb-2024, 12:36:49 pm
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NAVBAR</title>
    </head>
    <body>
        <header class="wrapper"> 
            <nav class="nav">
                 
                <div class="nav-logo"> 
                    <img src="Images/job.png" height="50px" style="margin-bottom:20px"> 
                </div>
                <div class="nav-menu">
                    <ul class="nav navbar-nav">
                        <li> <a href="index.jsp" class="link active"> HOME </a></li>
                        <li> <a href="about.jsp" class="link"> ABOUT US </a></li>
                        <li> <a href="simpleJobSearch.jsp" class="link"> SEARCH JOBS </a></li>
                        <li> <a href="companies.jsp" class="link"> COMPANIES </a></li>
                        <li> <a href="contactus.jsp" class="link"> CONTACT US </a></li>
                    </ul>
                </div>
                <div class="nav-button"> 
                    <a href="login.jsp"><button class="btn white-btn" id="loginBtn"> LOGIN </button></a>
                    <a href="register.jsp"><button class="btn" id="registerBtn"> REGISTER </button></a>
                </div>
                <div class="nav-menu-btn">
                    <i class="bx bx-menu"> </i>
                </div>
                
            </nav>
        </header>
    </body>
</html>