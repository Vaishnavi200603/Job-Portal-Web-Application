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
            
            
            <!--banner images-->
            <!------SEARCH SECTION SEARCH SECTION SEARCH SECTION ------>
            <div class="width-100 banner-section">
                <div class="container">
                    <h1 class="banner-heading">Find The Best Job For Your Future</h1>
                    <p class="banner-para">5 Lakh+ Jobs For You To Explore</p>
                    <div class="search-sect">
                        <a href="simpleJobSearch.jsp"><input type="text" class="search-textbox" placeholder="Search Technology"></a>
                    </div>
                    <div class="search-sect">
                      <a href="simpleJobSearch.jsp"><input type="text" class="search-textbox" placeholder="Select Location"></a>
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
            
            <!-------FEATURE SECTION FEATURE SECTION FEATURE SECTION------->
            <div class="width-100 feature-sect">
                <div class="container">
                    <div class="width-50">
                        <div class="feature-panel">
                            <img src="Images/search.avif" class="feature-img">
                            <h4 class="feature-title">DO YOU WANT TO FIND A JOB ?</h4>
                            <p class="feature-desc">More than 500+ Job Application Available, Look What Seems Right According To Your Experience And Education </p>
                            <a href="simpleJobSearch.jsp"> <button class="feature-btn">Find Job</button></a>
                        </div>
                    </div>

                </div>
            </div>
            
            
            <!--search button option-->
            
            <!--Job pictures and search-->
            <!-----RECENT JOB SECTION RECENT JOB SECTION RECENT JOB SECTION ----->
            <section class="job-listings">
                <h2>Latest Job Listings</h2> 
                    <div class="job"> 
                    <jsp:scriptlet>
                        Connection con = null;
                        String id="",  job_profile="", company="", experience="", date1="", time1="", time_venue="", job_location="";
                        try{
                            con = ConnectionPooling.DBConnection.getConnect();
                            PreparedStatement ps = con.prepareStatement("select * from jobs");
                            ResultSet rs = ps.executeQuery();
                            while(rs.next()){
                                id = rs.getString("id");
                                job_profile = rs.getString("job_profile");
                                company = rs.getString("company");
                                experience = rs.getString("experience");
                                time_venue = rs.getString("time_venue");
                                date1 = rs.getString("date1");
                                time1 = rs.getString("time1");
                                job_location = rs.getString("job_location");
                    </jsp:scriptlet>
                                <ul> 
                                    <li> 
                                        <h3><jsp:expression> job_profile </jsp:expression></h3> 
                                        <p><span class="fa fa-building"></span> &nbsp;&nbsp;<jsp:expression> company </jsp:expression></p> 
                                        <p><span class="fa fa-map-marker"></span> &nbsp;&nbsp;<jsp:expression> job_location </jsp:expression></p> 
                                        <p><span class="fa fa-clock-o"></span> &nbsp;&nbsp;<jsp:expression> experience </jsp:expression></p> 
                                        <p><span class="fa fa-calendar"></span> &nbsp;&nbsp;<jsp:expression> time_venue </jsp:expression> - <jsp:expression> date1 </jsp:expression>  <jsp:expression> time1 </jsp:expression></p>
                                        <a href="SeeFullDetails.jsp?jid=<jsp:expression>id</jsp:expression>">View Details</a> 
                                    </li> 
                                </ul> 
                    <jsp:scriptlet>
                            }
                        }
                        catch(Exception e){
                            e.printStackTrace();
                        }
                    </jsp:scriptlet>
                        
                </div>
            </section> 
            
            

            
            <!--footer part-->
            <div class="width-100">
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
            
            
        </div>    
    </body>
</html>