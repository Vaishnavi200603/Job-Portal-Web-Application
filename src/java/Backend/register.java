/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import ConnectionPooling.DBConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.SQLException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
//import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vaish
 */
public class register extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String first2 = req.getParameter("first1");
        String last2 = req.getParameter("last1");
        String email2 = req.getParameter("email1");
        String pass2 = req.getParameter("pass1");
        String gender2 = req.getParameter("gender1");
        String[] feilds2 = req.getParameterValues("feilds1");
        String city2 = req.getParameter("city1");
        
        String feild2 = "";
        if(feilds2 != null){
            for(String s : feilds2){
                feild2 = feild2 +  "  " + s; 
            }
        }
        
        
//        Database Connectivity
        Connection con = null;
        try{
           con = DBConnection.getConnect();
           con.setAutoCommit(false);
           //Database 1
           PreparedStatement ps = con.prepareStatement("insert into register(firstname, lastname, email, password, gender, feild, city)  values(?,?,?,?,?,?,?)");
           ps.setString(1, first2);
           ps.setString(2, last2);
           ps.setString(3, email2);
           ps.setString(4, pass2);
           ps.setString(5, gender2);
           ps.setString(6, feild2);
           ps.setString(7, city2);
           
            
           
           int i1 = ps.executeUpdate();
           
           //Database 2
           PreparedStatement ps2 = con.prepareStatement("insert into aboutusers(email, about, skills) values(?,?,?)");
           ps2.setString(1, email2);
           ps2.setString(2, "");
           ps2.setString(3, "");
         
           int i2 = ps2.executeUpdate();
           
           
           if(i1 > 0 && i2 > 0){
               con.commit();
               
               HttpSession session = req.getSession();
                session.setAttribute("session_firstName", first2);
                session.setAttribute("session_lastName", last2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_city", city2);
                session.setAttribute("session_feild", feild2);
                
                session.setAttribute("session_title", "");
                session.setAttribute("session_skills", "");
                
                if(gender2.equals("male") || gender2.equals("Male")){
                    session.setAttribute("session_profilepic", "boy.png");
                }
                else{
                    session.setAttribute("session_profilepic", "girl.jpg");
                }
                
                
               resp.sendRedirect("profile.jsp");
           }
           else{
               con.rollback();
               RequestDispatcher rd1 = req.getRequestDispatcher("header.jsp");
               rd1.include(req, resp);
               
               RequestDispatcher rd2 = req.getRequestDispatcher("loginError.jsp");
               rd2.include(req, resp);
               
               RequestDispatcher rd3 = req.getRequestDispatcher("registerDiv.jsp");
               rd3.include(req, resp);
               
               RequestDispatcher rd4 = req.getRequestDispatcher("footer.jsp");
               rd4.include(req, resp);
           }
        }
        catch(Exception e){
            try{
               con.rollback(); 
            }
            catch(Exception ee){
                ee.printStackTrace();
            }
            RequestDispatcher rd1 = req.getRequestDispatcher("header.jsp");
            rd1.include(req, resp);
               
            RequestDispatcher rd2 = req.getRequestDispatcher("loginError.jsp");
            rd2.include(req, resp);
               
            RequestDispatcher rd3 = req.getRequestDispatcher("registerDiv.jsp");
            rd3.include(req, resp);
               
            RequestDispatcher rd4 = req.getRequestDispatcher("footer.jsp");
            rd4.include(req, resp);
        }
        finally{
            try{
               con.close(); 
            }
            catch(Exception ee){
                ee.printStackTrace();
            }
        }
    }
}
