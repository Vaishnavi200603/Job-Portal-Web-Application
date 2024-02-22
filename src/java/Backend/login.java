/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import ConnectionPooling.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vaish
 */
public class login extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email2 = req.getParameter("email1");
        String pass2 = req.getParameter("pass1");
        String remember2 = req.getParameter("remember1");
        
        String first2="", last2="", gender2="", city2="", feild2="";
        
        //database Connectivity
        Connection con = null;
        try{
           con = DBConnection.getConnect();
           con.setAutoCommit(false);
           PreparedStatement ps = con.prepareStatement("select * from register where email=? and password=?");
           ps.setString(1, email2);
           ps.setString(2, pass2);
           
           ResultSet rs = ps.executeQuery();
           
           if(rs.next()){
               con.commit();
//               if(remember2.equals("rememberme")){
//                   Cookie ck1 = new Cookie("cookie_email", email2);
//                   ck1.setMaxAge(60 * 60 * 24 * 365);
//                   resp.addCookie(ck1);
//                   
//                   Cookie ck2 = new Cookie("cookie_status", "true");
//                   ck2.setMaxAge(60 * 60 * 24 * 365);
//                   resp.addCookie(ck2);
//               }
               first2 = rs.getString("firstname");
               last2 = rs.getString("lastname");
               gender2 = rs.getString("gender");
               city2 = rs.getString("city");
               feild2 = rs.getString("feild");
               
               HttpSession session = req.getSession();
               session.setAttribute("session_firstName", first2);
               session.setAttribute("session_lastName", last2);
               session.setAttribute("session_email", email2);
               session.setAttribute("session_gender", gender2);
               session.setAttribute("session_city", city2);
               session.setAttribute("session_feild", feild2);
               
               String title2="", skills2="";
               PreparedStatement ps2 = con.prepareStatement("select * from aboutusers where email=?");
               ps2.setString(1, email2);
               ResultSet rs2 = ps2.executeQuery();
               
               while(rs2.next()){
                   title2 = rs2.getString("about");
                   skills2 = rs2.getString("skills");
               }
               session.setAttribute("session_title", title2);
               session.setAttribute("session_skills", skills2);
                
                String filename="";
                PreparedStatement ps3 = con.prepareStatement("select * from profile_pics where email=?");
                ps3.setString(1, email2);
                ResultSet rs3 = ps3.executeQuery();
                
                while(rs3.next()){
                   filename = rs3.getString("path");
                }
                session.setAttribute("session_profilepics", filename);
               
               resp.sendRedirect("profile.jsp");
           }
           else{
               con.rollback();
               RequestDispatcher rd1 = req.getRequestDispatcher("header.jsp");
               rd1.include(req, resp);
               
               RequestDispatcher rd2 = req.getRequestDispatcher("loginError.jsp");
               rd2.include(req, resp);
               
               RequestDispatcher rd3 = req.getRequestDispatcher("loginDiv.jsp");
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
               
            RequestDispatcher rd3 = req.getRequestDispatcher("loginDiv.jsp");
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