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

<jsp:declaration> 
    String school1="", degree1="", startyear1="", endyear1="", grade1="", description1="";
</jsp:declaration>

<jsp:scriptlet> 
    String first = (String)session.getAttribute("session_firstName");
    String last = (String)session.getAttribute("session_lastName");
    String gender = (String)session.getAttribute("session_gender");
    String id = request.getParameter("id");
    
    Connection con = null;
    try{
        con = ConnectionPooling.DBConnection.getConnect();
        con.setAutoCommit(false);
        PreparedStatement ps = con.prepareStatement("select * from education where id=?");
        ps.setString(1,id);
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
            con.commit();
            
            school1 = rs.getString("school");
            degree1 = rs.getString("degree");
            startyear1 = rs.getString("startYear");
            endyear1 = rs.getString("endYear");
            grade1 = rs.getString("grade");
            description1 = rs.getString("description");
            
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
        
        <script> 
            function submitFunction(val){
                if(val==='update'){
                    document.editEducationForm.action="EditEducationDetails";
                    document.action.submit();
                }
                if(val==='delete'){
                    document.editEducationForm.action="DeleteEducationDetails";
                    document.action.submit();
                }
            }
        </script>
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
                        <form name="editEducationForm" method="POST"> 
                            <h2> Edit Your Education </h2>
                            <b> <jsp:expression> first </jsp:expression> <jsp:expression> last </jsp:expression> : <jsp:expression> session.getAttribute("session_email") </jsp:expression> </b> <br> <br>
                            <input type="hidden" value="<jsp:expression> id </jsp:expression>" name="id1"/>
                            School : <br> <input type="text" placeholder="Enter School Name" name="school1" class="text-field-design" value="<jsp:expression> school1 </jsp:expression>"/> <br><br>
                            Degree : <br><input type="text" placeholder="Enter Degree"  name="degree1" class="text-field-design" value="<jsp:expression> degree1 </jsp:expression>"/>  <br><br>
                            Start Year : <br><input type="text" placeholder="Enter Start Year"  name="startyear1" class="text-field-design" value="<jsp:expression> startyear1 </jsp:expression>"/> <br><br>
                            End Year : <br><input type="text" placeholder="Enter End Year"  name="endyear1" class="text-field-design" value="<jsp:expression> endyear1 </jsp:expression>"/> <br><br>
                            Grade : <br><input type="text" placeholder="Enter Grade"  name="grade1" class="text-field-design" value="<jsp:expression> grade1 </jsp:expression>"/> <br><br>
                            Discription : <br><textarea name="description1" class="text-field-design" <jsp:expression> description1 </jsp:expression>> </textarea> <br><br>
                            
                            <div class="row">
                                <input type="submit" value="UPDATE" class="text-field-design" onclick="submitFunction('update')"/> <br><br>
                                <input type="submit" value="DELETE" class="text-field-design" onclick="submitFunction('delete')"/>
                            </div>  
                        </form>
                    </div>
                </div>
                  
                
            <div class="col-md-2"></div>
        </div>
        
        <!--footer part-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

