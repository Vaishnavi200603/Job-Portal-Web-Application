/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import ConnectionPooling.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vaish
 */
public class AboutPageEdit extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        String email2 = (String)session.getAttribute("session_email");
        
        String first2 = req.getParameter("first1");
        String last2 = req.getParameter("last1");
        String city2 = req.getParameter("city1");
        String title2 = req.getParameter("title1");
        String skills2 = req.getParameter("skills1");
        
        Connection con = null;
        try{
            con = DBConnection.getConnect();
            con.setAutoCommit(false);
            //Database table - register
            PreparedStatement ps1 = con.prepareStatement("update register set firstname=?, lastname=?, city=? where email=?");
            ps1.setString(1, first2);
            ps1.setString(2, last2);
            ps1.setString(3, city2);
            ps1.setString(4, email2);
            int i1 = ps1.executeUpdate();
            
            //Database Table - aboutUsers
            PreparedStatement ps2 = con.prepareStatement("update aboutusers set about=?, skills=? where email=?");
            ps2.setString(1, title2);
            ps2.setString(2, skills2);
            ps2.setString(3, email2);
            int i2 = ps2.executeUpdate();
            
            if(i1 > 0 && i2 > 0){
                
                con.commit();
                session.setAttribute("session_firstName", first2);
                session.setAttribute("session_lastName", last2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_city", city2);
                
                session.setAttribute("session_about", title2);
                session.setAttribute("session_skills", skills2);
                
                resp.sendRedirect("profile.jsp");
            }
            else{
                con.rollback();
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("editProfileName.jsp");
                rd2.include(req, resp);
                
            }
            
            
        }
        catch(Exception e){
            try{
               con.rollback(); 
            }
            catch(Exception ee){
                ee.printStackTrace();
            }
            RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
            rd1.include(req, resp);
                
            RequestDispatcher rd2 = req.getRequestDispatcher("editProfileName.jsp");
            rd2.include(req, resp);
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
