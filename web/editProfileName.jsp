<%-- 
    Document   : profile
    Created on : 11-Feb-2024, 6:41:57 pm
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet> 
    String first2 = (String)session.getAttribute("session_firstName");
    String last2 = (String)session.getAttribute("session_lastName");
    String gender2 = (String)session.getAttribute("session_gender");
    String city2 = (String)session.getAttribute("session_city");
    String feilds2 = (String)session.getAttribute("session_feild");
    String title2 = (String)session.getAttribute("session_about");
    if(title2==null ||title2.equals("")){
        title2="";
    }
    String skills2 = (String)session.getAttribute("session_skills");
    if(skills2==null ||skills2.equals("")){
        skills2="";
    }
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
                        <form action="AboutPageEdit" method="POST"> 
                            <h2> Edit Your Profile </h2>
                            <b> <jsp:expression> session.getAttribute("session_email") </jsp:expression> </b> <br> <br>
                            <input type="text" placeholder="Update First Name" value="<jsp:expression> first2 </jsp:expression>" name="first1" class="text-field-design"/> <br><br>
                            <input type="text" placeholder="Update Last Name" value="<jsp:expression> last2 </jsp:expression>" name="last1" class="text-field-design"/>  <br><br>
                            <select name="gender1" placeholder="Update Gender" class="text-field-design">
                                <option value="Male"> Male </option>
                                <option value="Female"> Female </option>
                            </select>    
                            <br><br>
                            <select name="city1" placeholder="Update City" class="text-field-design">
                                <option><jsp:expression> city2 </jsp:expression></option>
                                <option value="Bangalore"> Bangalore </option>
                                <option value="Delhi"> Delhi </option>
                                <option value="Mumbai"> Mumbai </option>
                                <option value="Pune"> Pune </option>
                                <option value="Jaipur"> Jaipur </option>
                                <option value="Hyderabad"> Hyderabad </option>
                            </select> <br><br>
                            <input type="text" placeholder="Profile Title" value="<jsp:expression> title2 </jsp:expression>" name="title1" class="text-field-design"/> <br><br>
                            <textarea placeholder="Enter Skills" name="skills1" class="text-field-design"> <jsp:expression> skills2 </jsp:expression> </textarea> <br><br>
                            
                            <div class="row">
                                <a href="profile.jsp"><input type="submit" value="UPDATE" class="btn btn-danger text-field-design"/></a>
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

