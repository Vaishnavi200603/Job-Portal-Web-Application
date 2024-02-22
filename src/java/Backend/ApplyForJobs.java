/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import ConnectionPooling.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author vaish
 */
public class ApplyForJobs extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        String email = (String)session.getAttribute("session_email");
        
        String jid = req.getParameter("jobid");
        
        Date d = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
        String date1 = sdf1.format(d);
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH-mm-ss");
        String time1 = sdf2.format(d);
        
        Connection con = null;
        try{
            con = DBConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps = con.prepareStatement("insert into appliedjobs(email, jobid, date1, time1) values(?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, jid);
            ps.setString(3, date1);
            ps.setString(4, time1);
            
            
            int i = ps.executeUpdate();
            
            if(i > 0){
                con.commit();
                RequestDispatcher rd1 = req.getRequestDispatcher("successfullyApplied.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("SeeFullDetails.jsp?jid=" + jid);
                rd2.include(req, resp);
            }
            else{
                con.rollback();
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("SeeFullDetails.jsp?jid=" + jid);
                rd2.include(req, resp);
            }
        }
        catch(Exception e){
            try{
                con.rollback();
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("SeeFullDetails.jsp?jid=" + jid);
                rd2.include(req, resp); 
            }
            catch(Exception ee){
                ee.printStackTrace();
            }
            
        }
        finally{
            try{
                con.close();
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
    }
}
