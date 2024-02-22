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
            
            
            <!--1-->
            <div class="con">
                <form action="ContactUs" method="POST">

                    <label for="fname">First Name</label>
                    <input type="text1" id="fname" name="firstname" placeholder="Your name..">

                    <label for="lname">Last Name</label>
                    <input type="text1" id="lname" name="lastname" placeholder="Your last name..">

                    <label for="country">City</label>
                    <select id="country" name="country">
                        <option value="bangalore">Bangalore</option>
                        <option value="hyderabad">Hyderabad</option>
                        <option value="jaipur">Jaipur</option>
                        <option value="pune">Pune</option>
                        <option value="delhi">Delhi</option>
                        <option value="mumbai">Mumbai</option>
                    </select>

                    <label for="subject">Subject</label>
                    <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>

                    <input type="submit" class="submit" value="Submit">
                  
                </form>
              </div>
            
            
            <!--footer part-->
            <div class="width-100">
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
            
            
        </div>    
    </body>
</html>