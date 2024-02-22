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
            
   
            <section class="job-listings">
                <h2>Job Description</h2> 
                    <div class="job"> 
                    <jsp:scriptlet>
                        Connection con = null;
                        String id="",  job_profile="", company="", experience="", description="", date1="", time1="", time_venue="", job_location="",
                                salary="", no_of_openings="", c_email="", c_person_name="", c_phone_no="", c_person_profile="";
                       
                        try{
                            con = ConnectionPooling.DBConnection.getConnect();
                            PreparedStatement ps = con.prepareStatement("select * from jobs where id=?");
                            ps.setString(1, jobid);
                            ResultSet rs = ps.executeQuery();
                            
                            if(rs.next()){
                                id = rs.getString("id");
                                job_profile = rs.getString("job_profile");
                                company = rs.getString("company");
                                experience = rs.getString("experience");
                                description = rs.getString("description");
                                time_venue = rs.getString("time_venue");
                                date1 = rs.getString("date1");
                                time1 = rs.getString("time1");
                                job_location = rs.getString("job_location");
                                salary = rs.getString("salary");
                                no_of_openings = rs.getString("no_of_openings");
                                c_email = rs.getString("c_email");
                                c_person_name = rs.getString("c_person_name");
                                c_phone_no = rs.getString("c_phone_no");
                                c_person_profile = rs.getString("c_person_profile");
                            }
                        }
                        catch(Exception e){
                            e.printStackTrace();
                        }
                    </jsp:scriptlet>
                    <ul> 
                        <li>
                            <h3> <jsp:expression> job_profile </jsp:expression> </h3> 
                            <p><span class="fa fa-building"></span> &nbsp;&nbsp; Company : <jsp:expression> company </jsp:expression></p> 
                            <p><span class="fa fa-map-marker"></span> &nbsp;&nbsp; Location : <jsp:expression> job_location</jsp:expression></p>
                            <p><span class="fa fa-clock-o"></span> &nbsp;&nbsp; Experience Required : <jsp:expression> experience </jsp:expression></p> 
                            <p><span class="fa fa-calendar"></span> &nbsp;&nbsp; Time and Venue For Interview <jsp:expression> time_venue </jsp:expression> - <jsp:expression> date1 </jsp:expression>  <jsp:expression> time1 </jsp:expression></p>
                            <p><span class="fa fa-desktop"></span> &nbsp;&nbsp; Job Description : <jsp:expression> description </jsp:expression></p>
                            <p><span class="fa fa-inr"></span> &nbsp;&nbsp; Estimate Average Salary : <jsp:expression> salary </jsp:expression></p>
                            <p><span class="fa fa-users"></span> &nbsp;&nbsp; No Of Openings : <jsp:expression> no_of_openings </jsp:expression></p>
                            <br>
                            <h5> Interviewer Details </h5>
                            <p><span class="fa fa-user"></span> &nbsp;&nbsp;Name : <jsp:expression> c_person_name </jsp:expression></p>
                            <p><span class="fa fa-briefcase"></span> &nbsp;&nbsp;Profile : <jsp:expression> c_person_profile </jsp:expression></p>
                            <p><span class="fa fa-envelope"></span> &nbsp;&nbsp;Email : <jsp:expression> c_email </jsp:expression></p>
                            <p><span class="fa fa-phone"></span> &nbsp;&nbsp;Contact No : <jsp:expression> c_phone_no </jsp:expression></p>
                                        
                            <jsp:scriptlet>
                                Connection con1 = null;
                                try{
                                    con1 = ConnectionPooling.DBConnection.getConnect();
                                    PreparedStatement ps1 = con1.prepareStatement("select * from appliedjobs where email=? and jobid=?");
                                    ps1.setString(1, email);
                                    ps1.setString(2, jobid);
                                    
                                    ResultSet rs1 = ps1.executeQuery();
                                    
                                    if(rs1.next()){
                            </jsp:scriptlet>
                                            <h3> Already Applied </h3>
                                            <form action="DeleteMyJobApplication" method="post">
                                                <input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid"/>
                                                <input type="submit" value="Delete My Application"/>
                                            </form>
                            <jsp:scriptlet>        
                                    }
                                    else{
                                        if(email == null || email==""){
                                        </jsp:scriptlet> 
                                               <a href="login.jsp">Login To Apply</a> 
                                        <jsp:scriptlet>
                                            }
                                        else{
                                        </jsp:scriptlet>
                                                <form action="ApplyForJobs" method="POST"> 
                                                    <input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid"/>
                                                    <button> Apply Now </button>
                                                </form>
                                       <jsp:scriptlet>
                                            }
                                    }
                                }
                                catch(Exception e){
                                    e.printStackTrace();
                                }
                                </jsp:scriptlet>
                                
                                
                            
                             
                        </li> 
                    </ul> 
                </div>   
            </section> 
            
            <!--footer part-->
            <div class="width-100">
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
            
            
        </div>    
    </body>
</html>