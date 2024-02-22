 <%@page import="Backend.PathDetails"%>
<%@page import="java.io.File"%>
<%-- 
    Document   : profile
    Created on : 11-Feb-2024, 6:41:57 pm
    Author     : vaish
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet> 
    String first2 = (String)session.getAttribute("session_firstName");
    String last2 = (String)session.getAttribute("session_lastName");
    String gender2 = (String)session.getAttribute("session_gender");
    String city2 = (String)session.getAttribute("session_city");
    String feilds2 = (String)session.getAttribute("session_feild");
    String email2 = (String)session.getAttribute("session_email");
    String title2 = (String)session.getAttribute("session_about");
    String skills2 = (String)session.getAttribute("session_skills");
   
</jsp:scriptlet> 

<jsp:scriptlet> 
    if(first2==null ||first2.equals("")){
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet> 



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
       
        <link rel="stylesheet" type="text/css" href="CSS/style.css"/>
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>-->
    </head>
    <body>
        <!--header part-->
        <jsp:include page="profileHeader.jsp"></jsp:include>
        
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 ">
                <!--Personal Information-->
                <div class="row profile-image"> 
                    <div class="col-md-2">
                        <!--<a href="editProfilePicture.jsp" style="font-size : 12px; float: right"><span class="fa fa-pencil"></span></a>-->
                        <jsp:scriptlet> 
                            String m = null;
                            String f = null;
                            if(gender2.equals("male") || gender2.equals("Male")){
                        </jsp:scriptlet>
                                <img src="Images/boy.png" height="100"/>
                        <jsp:scriptlet>     
                            }
                            else{
                        </jsp:scriptlet>
                                <img src="Images/girl.jpg" height="100"/>
                        <jsp:scriptlet>        
                             }
                         </jsp:scriptlet>
                    </div>
                    
                    <div class="col-md-10">
                        <h3> 
                            <jsp:expression> first2.toUpperCase() + " " + last2.toUpperCase() </jsp:expression> 
                            <a href="editProfileName.jsp" style="font-size : 12px; float: right"><span class="fa fa-pencil"></span></a>
                            <!--<span style="font-size: 12px"> <a href="editProfileName.jsp"> Edit Details </a> </span>--> 
                        </h3>
                        GENDER : <jsp:expression> gender2 </jsp:expression> <br>
                        CITY : <jsp:expression> city2 </jsp:expression> <br>
                        TITLE : <jsp:expression> title2 </jsp:expression> <br>
                        SKILL : <jsp:expression> skills2 </jsp:expression> <br>
                    </div>
                </div> 
                <br> <br>    
                    
                <!--Education information-->
                <div class="row profile-image">
                    <div class="col-md-2">
                        <img src="Images/study.jpg" height="90"/>
                    </div>
                    
                    <div class="col-md-10">
                        <h4> EDUCATION DETAILS <a href="addEducation.jsp" style="font-size : 12px; float: right"> <span class="fa fa-plus""></span> </a> <br> </h4> 
                    <jsp:scriptlet> 
                        String email = (String) session.getAttribute("session_email");
                        String id="", school="", degree="", grade="", startyear="", endyear="";
                        Connection con = null;
                        try{
                            con = ConnectionPooling.DBConnection.getConnect();
                            PreparedStatement ps = con.prepareStatement("select * from education where email=?");
                            ps.setString(1, email);
                            
                            ResultSet rs = ps.executeQuery();
                            
                            while(rs.next()){
                                id = rs.getString("id");
                                school = rs.getString("school");
                                degree = rs.getString("degree");
                                grade = rs.getString("grade");
                                startyear = rs.getString("startyear");
                                endyear = rs.getString("endyear");
                    </jsp:scriptlet>
                     
                    <div> 
                        <a href="editEducation.jsp?id=<jsp:expression> id </jsp:expression>" style="font-size : 12px; float: right"><span class="fa fa-pencil"></span></a>
                        SCHOOL : <jsp:expression> school </jsp:expression> <br>
                        DEGREE : <jsp:expression> degree </jsp:expression> <span style="color:grey"> (<jsp:expression> startyear </jsp:expression>-<jsp:expression> endyear </jsp:expression>)</span><br>
                        GRADE : <jsp:expression> grade </jsp:expression> <br>
                        <br>
                    </div> 
                                
                    <jsp:scriptlet>        
                            }
                        }
                    catch(Exception e){
                        try{
                            con.rollback();
                        }
                        catch(Exception ee){
                            ee.printStackTrace();
                        }
                    }
                    finally{
                        try{
                            con.close();
                        }
                        catch(Exception ee){
                            ee.printStackTrace();
                        }
                    }
                    </jsp:scriptlet>
                        
                    </div>
                </div> 
                <br> <br> 
                        
                <!--Experience Information-->
                <div class="row profile-image">
                    <div class="col-md-2">
                        <img src="Images/experience.jpg" height="130"/>
                    </div>
                    <div class="col-md-10">
                        <h4> EXPERIENCE DETAILS <a href="addExperience.jsp" style="font-size : 12px; float: right"> <span class="fa fa-plus""></span> </a> <br> </h4> 
                    <jsp:scriptlet> 
                        String id1="", company1="", location1="",  year1="", position1="";
                       
                        
                        try{
                            con = ConnectionPooling.DBConnection.getConnect();
                            PreparedStatement ps = con.prepareStatement("select * from experience where email=?");
                            ps.setString(1, email);
                            
                            ResultSet rs = ps.executeQuery();
                            
                            while(rs.next()){
                                id1 = rs.getString("id");
                                company1 = rs.getString("company");
                                location1 = rs.getString("location");
                                year1 = rs.getString("year");
                                position1 = rs.getString("position");
                    </jsp:scriptlet>
                     
                    <div> 
                        <a href="editExperience.jsp?id=<jsp:expression> id1 </jsp:expression>" style="font-size : 12px; float: right"><span class="fa fa-pencil"></span></a>
                        COMPANY : <jsp:expression> company1 </jsp:expression> <br>
                        LOCATION : <jsp:expression> location1 </jsp:expression> <span style="color:grey"> (<jsp:expression> year1 </jsp:expression>)</span><br>
                        POSITION : <jsp:expression> position1 </jsp:expression> <br>
                        <br>
                    </div> 
                                
                    <jsp:scriptlet>        
                            }
                        }
                    catch(Exception e){
                        try{
                            con.rollback();
                        }
                        catch(Exception ee){
                            ee.printStackTrace();
                        }
                    }
                    finally{
                        try{
                            con.close();
                        }
                        catch(Exception ee){
                            ee.printStackTrace();
                        }
                    }
                     </jsp:scriptlet>
                        
                    </div>
                </div> 
                <br> <br> 
                
                <!--Resume Upload-->
                <div class="row profile-image">
                    <div class="col-md-2">
                        <img src="Images/experience.jpg" height="130"/>
                    </div>
                    <div class="col-md-10">
                        <h4> RESUME <a href="addExperience.jsp"> </a> <br> </h4> 
                        <div> 
                            <a class="resume-style" href="uploadResume.jsp"> Upload Resume </a>
                            <jsp:scriptlet> 
                               String fileName = null; 
                                    try{
                                    con = ConnectionPooling.DBConnection.getConnect();
                                    PreparedStatement ps = con.prepareStatement("select * from resumes where email=?");
                                    ps.setString(1, email);
                                    
                                    ResultSet rs = ps.executeQuery();
                                    if(rs.next()){
                                    fileName = rs.getString("path");
                            </jsp:scriptlet>
                            &nbsp; &nbsp; &nbsp; <a href="DownloadResume?fn=<jsp:expression>fileName</jsp:expression>" class="text-field-design-resume resume-style"/> Download Resume </a>
                            <jsp:scriptlet>
                                    }
                                }
                                catch(Exception e){
                                    e.printStackTrace();
                                }
                            </jsp:scriptlet>
                        </div>
                        <br>
                        <div class="row"> 
                            <a class="resume-style" href="resumeBuilder.jsp"> Create Resume </a>
                            <jsp:scriptlet> 
                                File file1 = new File(PathDetails.RESUMEBUILDER + email2 + ".pdf");
                                if(file1.exists()){
                            </jsp:scriptlet>
                                    &nbsp; &nbsp; &nbsp; <a href="DownloadResumeBuilder?fn=<jsp:expression>email2+".pdf"</jsp:expression>" class="text-field-design-resume resume-style"/> Download Resume </a>
                            <jsp:scriptlet> 
                                }
                            </jsp:scriptlet>
                        </div>
                    </div>
                </div>
                <br> <br>
                    
                <!--submit-->
                <div class="row" style="background-color:grey">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <input type="submit" value="Follow" class="text-field-design"/>
                    </div>
                    <div class="col-md-2"></div>
                </div>  
             </div>
            <div class="col-md-2"></div>
        </div>
        
        <!--footer part-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
