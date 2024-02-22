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
public class EditEducationDetails extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
//        HttpSession session = req.getSession();
//        String id1 = (String)session.getAttribute("session_id");

     
        String id2 = req.getParameter("id1");
        String school2 = req.getParameter("school1");
        String degree2 = req.getParameter("degree1");
        String startyear2 = req.getParameter("startyear1");
        String endyear2 = req.getParameter("endyear1");
        String grade2 = req.getParameter("grade1");
        String description2 = req.getParameter("description1");
        
        Connection con = null;
        try{
            con = DBConnection.getConnect();
            con.setAutoCommit(false);
            

            
            PreparedStatement ps1 = con.prepareStatement("update education set school=?, degree=?, startYear=?, endYear=?, grade=?, description=? where id=?");
            
            ps1.setString(1, school2);
            ps1.setString(2, degree2);
            ps1.setString(3, startyear2);
            ps1.setString(4, endyear2);
            ps1.setString(5, grade2);
            ps1.setString(6, description2);
            ps1.setString(7, id2);
            
            int i1 = ps1.executeUpdate();
            out.println("inside execute update");
            
            if(i1>0){
                con.commit();
                resp.sendRedirect("profile.jsp");
            }
            else{
                con.rollback();
                out.println(i1);
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("editEducation.jsp");
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
                
                RequestDispatcher rd2 = req.getRequestDispatcher("editEducation.jsp");
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
