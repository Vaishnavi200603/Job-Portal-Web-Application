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

/**
 *
 * @author vaish
 */
public class DeleteExperienceDetails extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String id2 = req.getParameter("id1");
        
        Connection con = null;
        try{
           con = DBConnection.getConnect();
           con.setAutoCommit(false);
           
           PreparedStatement ps = con.prepareStatement("delete from experience where id=?");
           ps.setString(1, id2);
           
           int i = ps.executeUpdate();
           
           if(i > 0){
               con.commit();
               resp.sendRedirect("profile.jsp");
           }
           else{
               con.rollback();
               out.println(i);
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
            }
            RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
            rd1.include(req, resp);
               
            RequestDispatcher rd2 = req.getRequestDispatcher("editExperience.jsp");
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