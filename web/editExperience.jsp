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
    String company1="", location1="", year1="", position1="", description1="";
</jsp:declaration>

<jsp:scriptlet> 
    String first = (String)session.getAttribute("session_firstName");
    String last = (String)session.getAttribute("session_lastName");
    String id = request.getParameter("id");
    String gender = (String)session.getAttribute("session_gender");
    
 
    Connection con = null;
    try{
        con = ConnectionPooling.DBConnection.getConnect();
        con.setAutoCommit(false);
        PreparedStatement ps = con.prepareStatement("select * from experience where id=?");
        ps.setString(1,id);
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
            con.commit();
            company1 = rs.getString("company");
            location1 = rs.getString("location");
            year1 = rs.getString("year");
            position1 = rs.getString("position");
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
                    document.editExperienceForm.action="EditExperienceDetails";
                    document.action.submit();
                }
                if(val==='delete'){
                    document.editExperienceForm.action="DeleteExperienceDetails";
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
                        <form name="editExperienceForm" method="POST"> 
                            <h2> Edit Your Experience </h2>
                            <b> <jsp:expression> first </jsp:expression> <jsp:expression> last </jsp:expression> : <jsp:expression> session.getAttribute("session_email") </jsp:expression> </b> <br> <br>
                            <input type="hidden" value="<jsp:expression> id </jsp:expression>" name="id1"/>
                            Company : <br> <input type="text" placeholder="Enter Company Name" name="company1" class="text-field-design" value="<jsp:expression> company1 </jsp:expression>"/> <br><br>
                            Location : <br><input type="text" placeholder="Enter Location"  name="location1" class="text-field-design" value="<jsp:expression> location1 </jsp:expression>"/>  <br><br>
                            Year : <br><input type="text" placeholder="Enter Year"  name="year1" class="text-field-design" value="<jsp:expression> year1 </jsp:expression>"/> <br><br>
                            Position : <br><input type="text" placeholder="Enter Position"  name="position1" class="text-field-design" value="<jsp:expression> position1 </jsp:expression>"/> <br><br>
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

