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
       
        <script>
            function searchByTechnology(tech){
                //1. creates An XMLHttpRequest Object
                //for new version
                var obj;
                if(window.XMLHttpRequest){
                    obj = new XMLHttpRequest();
                }
                //for older version
                else{
                    obj = new ActiveXObject("Microsoft.XMLHTTP");
                }
                
                //2. Specify The Request
                obj.open("POST", "SimpleJobSearch?technology="+tech, true);
                
                //3. Sends the request to the server
                obj.send();
                
                //4. get the response - calls the function when readyState property changes
                obj.onreadystatechange = function(){
                    if(obj.readyState === 4 && obj.status === 200){
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
            }
            
            function searchByLocation(loc){
                //1. creates An XMLHttpRequest Object
                //for new version
                var obj;
                if(window.XMLHttpRequest){
                    obj = new XMLHttpRequest();
                }
                //for older version
                else{
                    obj = new ActiveXObject("Microsoft.XMLHTTP");
                }
                
                //2. Specify The Request
                obj.open("POST", "LocationJobSearch?location="+loc, true);
                
                //3. Sends the request to the server
                obj.send();
                
                //4. get the response - calls the function when readyState property changes
                obj.onreadystatechange = function(){
                    if(obj.readyState === 4 && obj.status === 200){
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
            }
            
        </script>
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
            
            
            <!--banner images-->
            <!------SEARCH SECTION SEARCH SECTION SEARCH SECTION ------>
            <div class="width-100 banner-section">
                <div class="container">
                    <h1 class="banner-heading">Find The Best Job For Your Future</h1>
                    <p class="banner-para">5 Lakh+ Jobs For You To Explore</p>
                    <div class="search-sect">
                        <input type="text" class="search-textbox" placeholder="Search Technology" onkeyup="searchByTechnology(this.value)">                    
                    </div>
                    <div class="search-sect">
                      <input type="text" class="search-textbox" placeholder="Select Location" onkeyup="searchByLocation(this.value)">
                      <i class="fa fa-life-ring icons" aria-hidden="true"></i>
                    </div>
                    <div class="search-sect">
                      <button class="search-button">
                        <i class="fa fa-search " aria-hidden="true"></i> Search Here </button>
                    </div>
                    <div class="search-sect">
                    <jsp:scriptlet>
                        
                        if(email == null || email == ""){
                    </jsp:scriptlet>  
                            <input type="text" class="search-textbox" placeholder="No Applied Jobs">
                            
                    <jsp:scriptlet>
                        }
                        else{
                    </jsp:scriptlet>  
                            <a href="myAppliedJobs.jsp"> <input type="text" class="search-textbox" placeholder="My Applied Jobs"></a>
                            <i class="fa fa-caret-down icons" aria-hidden="true"></i>
                    <jsp:scriptlet>
                        }
                    </jsp:scriptlet>   
                      
                    </div>
                    
                </div>
            </div>
            
            
            <!--search button option-->
            
            <!--Job pictures and search-->
            <!-----RECENT JOB SECTION RECENT JOB SECTION RECENT JOB SECTION ----->
            <section class="job-listings">
                <h2>Latest Job Listings</h2> 
                    <div class="job"> 
                        <span id="respgenerated"> 
                            No Result Found
                        </span>
                    </div>
            </section> 
            
           <!--footer part-->
            <div class="width-100">
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
            
            
        </div>    
    </body>
</html>