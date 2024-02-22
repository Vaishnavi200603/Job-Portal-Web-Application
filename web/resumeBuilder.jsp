<%-- 
    Document   : profile
    Created on : 11-Feb-2024, 6:41:57 pm
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>

<jsp:scriptlet> 
    String first = (String)session.getAttribute("session_firstName");
    String last = (String)session.getAttribute("session_lastName");
    String gender = (String)session.getAttribute("session_gender");
    String email = (String)session.getAttribute("session_email");
    
</jsp:scriptlet> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resume builder</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
       
        <link rel="stylesheet" type="text/css" href="CSS/style.css"/>
        
       
    </head>
    <body>
        <!--header part-->
        <jsp:include page="profileHeader.jsp"></jsp:include>
        
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 profile-image">
                <div class="row"> 
                    <div class="col-md-2">
                        <jsp:scriptlet> 
                            String m = null;
                            String f = null;
                            if(gender.equals("male") || gender.equals("Male")){
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
                        <form action="CreateResume" method="POST"> 
                            <h2> Resume Details </h2>
                            <b> <jsp:expression> first </jsp:expression> <jsp:expression> last </jsp:expression> : <jsp:expression> email </jsp:expression> </b> <br> <br>
                            
                            <h4> PERSONAL DETAILS </h4>
                            <input type="text" placeholder="Enter First Name" name="first1" class="text-field-design" readonly="" value="<jsp:expression> first </jsp:expression>"/> <a href="editProfileName.jsp" style="font-size : 12px;"><span class="fa fa-pencil"></span></a><br><br>
                            <input type="text" placeholder="Enter Last Name" name="last1" class="text-field-design" readonly="" value="<jsp:expression> last </jsp:expression>"/> <a href="editProfileName.jsp" style="font-size : 12px;"><span class="fa fa-pencil"></span></a><br><br>
                            <input type="text" placeholder="Enter Email" name="email1" class="text-field-design" readonly="" value="<jsp:expression> email </jsp:expression>"/> <br><br>
                            <h6> Address </h6>
                            <textarea placeholder="Your Address" name="address1" class="text-field-design"> </textarea> <br><br>
                            <h6> Career Objective </h6>
                            <textarea placeholder="Your Career Objective" name="career1" class="text-field-design"> </textarea> <br><br>
                            
                            <h4> EDUCATION DETAILS </h4>
                            <table class="table table-bordered"> 
                                <thead class="thead-dark"> 
                                    <tr>
                                        <th> School/Collage </th>
                                        <th> Degree </th>
                                        <th> StartYear </th>
                                        <th> Endyear </th>
                                        <th> Percentage </th>
                                        <th> Edit </th>
                                    </tr>
                                </thead>
                                
                            
                            <jsp:scriptlet> 
                                String school="", degree="", startyear="", endyear="", grade="", id="";
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
                                        startyear = rs.getString("startYear");
                                        endyear = rs.getString("endYear");
                                        grade = rs.getString("grade");
                            </jsp:scriptlet>
                            
                            <tbody> 
                                <tr> 
                                    <td> <jsp:expression> school </jsp:expression> </td>
                                    <td> <jsp:expression> degree </jsp:expression></td>
                                    <td> <jsp:expression> startyear </jsp:expression></td>
                                    <td> <jsp:expression> endyear </jsp:expression></td>
                                    <td> <jsp:expression> grade </jsp:expression></td>
                                    <td> <a href="editEducation.jsp?id=<jsp:expression> id </jsp:expression>" style="font-size : 12px;"><span class="fa fa-pencil"></span></a> </td>
                                </tr>
                            </tbody>
                            
                            <jsp:scriptlet>
                                    }
                                }
                                catch(Exception e){
                                
                                }
                                
                            </jsp:scriptlet>
                            </table>
                            <br>
                            
                            <h4> EXPERIENCE DETAILS</h4>
                            <table class="table table-bordered"> 
                                <thead class="thead-dark"> 
                                    <tr>
                                        <th> Company </th>
                                        <th> Location </th>
                                        <th> Year </th>
                                        <th> Position </th>
                                        <th> Edit </th>
                                    </tr>
                                </thead>
                            <jsp:scriptlet> 
                                String company="", location="", year="", position="", exid="";
                                try{
                                    con = ConnectionPooling.DBConnection.getConnect();
                                    PreparedStatement ps = con.prepareStatement("select * from experience where email=?");
                                    ps.setString(1, email);
                                    ResultSet rs = ps.executeQuery();
                                    while(rs.next()){
                                        exid = rs.getString("id");
                                        company = rs.getString("company");
                                        location = rs.getString("location");
                                        year = rs.getString("year");
                                        position = rs.getString("position");
                            </jsp:scriptlet>
                                
                            <tbody> 
                                <tr> 
                                    <td> <jsp:expression> company </jsp:expression> </td>
                                    <td> <jsp:expression> location </jsp:expression></td>
                                    <td> <jsp:expression> year </jsp:expression></td>
                                    <td> <jsp:expression> position </jsp:expression></td>
                                    <td> <a href="editExperience.jsp?exid=<jsp:expression> exid </jsp:expression>" style="font-size : 12px;"><span class="fa fa-pencil"></span></a> </td>
                                </tr>
                            </tbody>
                            
                            <jsp:scriptlet>
                                    }
                                }
                                catch(Exception e){
                                
                                }
                                
                            </jsp:scriptlet>
                            </table>
                            <br>
                            <h4> Hobbies </h4>
                            <textarea placeholder="Your Hobbies1" name="hobbies1" class="text-field-design"> </textarea> <br>
                            
                            <br>
                            <h4> Personal Information </h4>
                            <input type="date" name="dob1" placeholder="Date Of Birth" class="text-field-design"></textfield> <br><br>
                            <input type="text" name="martial1" placeholder="Martial Status" class="text-field-design"></textfield> <br><br>
                            <input type="text" name="language1" placeholder="Language Profiency" class="text-field-design"></textfield> <br><br>
                            <input type="submit" value="SUBMIT" class="text-field-design"/> <br><br>
                        </form>
                    </div>
                </div>
                  
                
            <div class="col-md-2"></div>
        </div>
        
        <!--footer part-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

