<%-- 
    Document   : index.jsp
    Created on : 11-Feb-2024, 12:34:52 pm
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<%--<jsp:include page="CheckCookie"> </jsp:include>--%>

<jsp:declaration> 
    String jobid;
    String email;
</jsp:declaration>
<jsp:scriptlet> 
    email = (String)session.getAttribute("session_email");
    jobid = request.getParameter("jid");
</jsp:scriptlet>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JOB PORTAL WEBSITE</title>
        <link rel="stylesheet"  type="text/css" href="CSS/style.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
       
        
    </head>
    <body>
        <div class="container-fluid">
        
            <jsp:scriptlet>
                if(email != null || email != ""){
            </jsp:scriptlet> 
                    <!--header part : login/register-->
                    <jsp:include page="profileHeader.jsp"></jsp:include>
            <jsp:scriptlet>
                }
                else{
            </jsp:scriptlet>
                    <!--profile header part : logout-->
                    <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
            
            
            <!--1.-->
            <div class="responsive-container-block bigContainer">
                <div class="responsive-container-block Container">
                    <div class="responsive-container-block leftSide">
                        <p class="text-blk heading">
                            Meet Our Creative Team
                        </p>
                        <p class="text-blk subHeading">
                            We are a technology company on a mission to equip students with relevant skills & practical exposure to help them get the best possible start to their careers. Imagine a world full of freedom and possibilities. A world where you can discover your passion and turn it into your career. A world where you graduate fully assured, confident, and prepared to stake a claim on your place in the world.
                        </p>
                    </div>
                    <div class="responsive-container-block rightSide">
                        <img class="number1img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/ET32.jpg">
                        <img class="number2img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/d14.png">
                        <img class="number3img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/b245.png">
                        <img class="number5img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/Customer supports.png">
                        <iframe allowfullscreen="allowfullscreen" class="number4vid" poster="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/b242.png" src="https://www.youtube.com/embed/svg%3E?">
                        </iframe>
                        <img class="number7img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/d51.png">
                        <img class="number6img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/d12.png">
                    </div>
                </div>
            </div>
            
            <!--2.-->
            <div class="responsive-container-block bigContainer">
                <div class="responsive-container-block Container">
                    <img class="mainImg" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/eaboutus1.svg">
                    <div class="allText aboveText">
                        <p class="text-blk headingText">
                            Our Mission
                        </p>
                        <p class="text-blk subHeadingText">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        </p>
                        <p class="text-blk description">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fermentum pulvinar ullamcorper suspendisse ac eget. Pellentesque tempus leo in ullamcorper quis vestibulum ligula elementum ut.
                        </p>
                        <button class="explore">
                            Explore
                        </button>
                    </div>
                </div>
                <div class="responsive-container-block Container bottomContainer">
                    <img class="mainImg" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/xpraup2.svg">
                    <div class="allText bottomText">
                        <p class="text-blk headingText">
                            Our Vision
                        </p>
                        <p class="text-blk subHeadingText">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        </p>
                        <p class="text-blk description">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fermentum pulvinar ullamcorper suspendisse ac eget. Pellentesque tempus leo in ullamcorper quis vestibulum ligula elementum ut.
                        </p>
                        <button class="explore">
                            Explore
                        </button>
                    </div>
                </div>
            </div>
            
            <!--footer part-->
            <div class="width-100">
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
            
            
        </div>    
    </body>
</html>