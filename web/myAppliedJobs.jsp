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
            
            <!--search button option-->
            
            <!--Job pictures and search-->
            <!-----RECENT JOB SECTION RECENT JOB SECTION RECENT JOB SECTION ----->
            <section class="job-listings">
                <h2>My Applied Jobs</h2> 
                    <div class="job"> 
                    <jsp:scriptlet>
                        Connection con = null;
                        String id="",  job_profile="", company="", experience="", date1="", time1="", time_venue="", job_location="";
                        try{
                            con = ConnectionPooling.DBConnection.getConnect();
                            PreparedStatement ps = con.prepareStatement("select * from appliedjobs where email=?");
                            ps.setString(1, email);
                            ResultSet rs = ps.executeQuery();
                            while(rs.next()){
                                id = rs.getString("jobid");
                                
                                PreparedStatement ps2 = con.prepareStatement("select * from jobs where id=?");
                                ps2.setString(1, id);
                                ResultSet rs2 = ps2.executeQuery();
                                
                                
                                while(rs2.next()){
                                    id = rs2.getString("id");
                                    job_profile = rs2.getString("job_profile");
                                    company = rs2.getString("company");
                                    experience = rs2.getString("experience");
                                    time_venue = rs2.getString("time_venue");
                                    date1 = rs2.getString("date1");
                                    time1 = rs2.getString("time1");
                                    job_location = rs2.getString("job_location");
                        
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