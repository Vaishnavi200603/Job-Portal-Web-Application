<%-- 
    Document   : profile
    Created on : 11-Feb-2024, 6:41:57 pm
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet> 
    String first = (String)session.getAttribute("session_firstName");
    String last = (String)session.getAttribute("session_lastName");
    String gender = (String)session.getAttribute("session_gender");
</jsp:scriptlet> 

<jsp:scriptlet> 
    if(first==null ||first.equals("")){
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
                        <form action="AddExperienceDetails" method="POST"> 
                            <h2> Add Your Experience </h2>
                            <b> <jsp:expression> first </jsp:expression> <jsp:expression> last </jsp:expression> : <jsp:expression> session.getAttribute("session_email") </jsp:expression> </b> <br> <br>
                            Company : <br> <input type="text" placeholder="Enter Company Name" name="company1" class="text-field-design"/> <br><br>
                            Location : <br><input type="text" placeholder="Enter Location"  name="location1" class="text-field-design"/>  <br><br>
                            Year : <br><input type="text" placeholder="Enter Year"  name="year1" class="text-field-design"/> <br><br>
                            Position : <br><input type="text" placeholder="Enter Position"  name="position1" class="text-field-design"/> <br><br>
                            Discription : <br><textarea name="description1" class="text-field-design"> </textarea> <br><br>
                            
                            <div class="row">
                                <a href="profile.jsp"><input type="submit" value="ADD EXPERIENCE" class="btn btn-danger text-field-design"/></a>
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

