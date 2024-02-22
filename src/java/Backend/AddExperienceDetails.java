/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import ConnectionPooling.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class AddExperienceDetails extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        String email2 = (String)session.getAttribute("session_email");
        
        String company2 = req.getParameter("company1");
        String location2 = req.getParameter("location1");
        String year2 = req.getParameter("year1");
        String position2 = req.getParameter("position1");
        String description2 = req.getParameter("description1");
        
        Connection con = null;
        try{
            con = DBConnection.getConnect();
            con.setAutoCommit(false);
            //Database table - experience
            PreparedStatement ps1 = con.prepareStatement("insert into experience(email, company, location, year, position, description) values(?,?,?,?,?,?)");
            ps1.setString(1, email2);
            ps1.setString(2, company2);
            ps1.setString(3, location2);
            ps1.setString(4, year2);
            ps1.setString(5, position2);
            ps1.setString(6, description2);
            
            int i1 = ps1.executeUpdate();
            
            if(i1 > 0){
                con.commit();
                resp.sendRedirect("profile.jsp");
            }
            else{
                con.rollback();
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("addExperience.jsp");
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
                
            RequestDispatcher rd2 = req.getRequestDispatcher("addExperience.jsp");
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
