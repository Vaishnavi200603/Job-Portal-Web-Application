<%-- 
    Document   : uploadResume
    Created on : 16-Feb-2024, 2:38:13 pm
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String first = (String) session.getAttribute("session_firstName");
    String last = (String) session.getAttribute("session_lastName");
    String gender = (String)session.getAttribute("session_gender");
</jsp:scriptlet>
<jsp:scriptlet>
    if(first == null || first.equals("")){
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
        <jsp:include page="header.jsp"/>
        
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 profile-image">
                <div class="row"> 
                    <div class="col-md-2">
                        <jsp:scriptlet> 
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
                        <form action="UpdateResume" method="POST" enctype="multipart/form-data"> 
                            <h2> Upload Resume </h2>
                            <b> <jsp:expression> first </jsp:expression> <jsp:expression> last </jsp:expression> : <jsp:expression> session.getAttribute("session_email") </jsp:expression> </b> <br> <br>
                            <input type="file" name="uploadResume"/> <br><br>
                            <div class="row">
                                <input type="submit" value="UPDATE RESUME" class="text-field-design"/> <br><br>
                                
                            </div>  
                        </form>
                    </div>
                </div>
                  
                
            <div class="col-md-2"></div>
        </div>
        
        <jsp:include page="footer.jsp"/>
    </body>
</html>
