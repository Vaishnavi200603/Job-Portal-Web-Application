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
public class EditExperienceDetails extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
//        HttpSession session = req.getSession();
//        String id1 = (String)session.getAttribute("session_id");
        
        String id2 = req.getParameter("id1");
        String company2 = req.getParameter("company1");
        String location2 = req.getParameter("location1");
        String year2 = req.getParameter("year1");
        String position2 = req.getParameter("position1");
        String description2 = req.getParameter("description1");
        
        Connection con = null;
        try{
            con = DBConnection.getConnect();
            con.setAutoCommit(false);
            //Database table - experinece
            PreparedStatement ps1 = con.prepareStatement("update experience set company=?, location=?, year=?, position=?, description=? where id=?");
            
            ps1.setString(1, company2);
            ps1.setString(2, location2);
            ps1.setString(3, year2);
            ps1.setString(4, position2);
            ps1.setString(5, description2);
            ps1.setString(6, id2);
            
            int i1 = ps1.executeUpdate();
            
            if(i1 > 0){
                con.commit();
                resp.sendRedirect("profile.jsp");
            }
            else{
                con.rollback();
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("editExperience.jsp");
                rd2.include(req, resp);
                
            }
            
            
        }
        catch(Exception e){
            try{
               con.rollback(); 
            }
            catch(Exception ee){
                ee.printStackTrace();
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("editExperience.jsp");
                rd2.include(req, resp);
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
    }
}
