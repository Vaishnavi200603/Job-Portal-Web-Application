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
public class AddEducationDetails extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        String email2 = (String)session.getAttribute("session_email");
        
        String school2 = req.getParameter("school1");
        String college2 = req.getParameter("college1");
        String start2 = req.getParameter("startyear1");
        String end2 = req.getParameter("endyear1");
        String grade2 = req.getParameter("grade1");
        String description2 = req.getParameter("description1");
        
        Connection con = null;
        try{
            con = DBConnection.getConnect();
            con.setAutoCommit(false);
            //Database table - education
            PreparedStatement ps1 = con.prepareStatement("insert into education(email, school, degree, startYear, endYear, grade, description) values(?,?,?,?,?,?,?)");
            ps1.setString(1, email2);
            ps1.setString(2, school2);
            ps1.setString(3, college2);
            ps1.setString(4, start2);
            ps1.setString(5, end2);
            ps1.setString(6, grade2);
            ps1.setString(7, description2);
            int i1 = ps1.executeUpdate();
            
            if(i1 > 0){
                con.commit();
                resp.sendRedirect("profile.jsp");
            }
            else{
                con.rollback();
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("editDetails.jsp");
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
                
                RequestDispatcher rd2 = req.getRequestDispatcher("editDetails.jsp");
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
