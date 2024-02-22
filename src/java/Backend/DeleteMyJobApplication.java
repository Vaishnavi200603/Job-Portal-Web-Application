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
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class DeleteMyJobApplication extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        String email = (String)session.getAttribute("session_email");
        
        String jid = req.getParameter("jobid");
        
        Connection con = null;
        try{
            con = DBConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps = con.prepareStatement("delete from appliedjobs where email=? and jobid=? ");
            ps.setString(1, email);
            ps.setString(2, jid);
            int i = ps.executeUpdate();
            
            if(i > 0){
                con.commit();
                resp.sendRedirect("myAppliedJobs.jsp");
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
