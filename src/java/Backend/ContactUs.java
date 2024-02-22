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
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vaish
 */
public class ContactUs extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String first1 = req.getParameter("firstname");
        String last1 = req.getParameter("lastname");
        String country1 = req.getParameter("country");
        String subject1 = req.getParameter("subject");
        
        
        Date d = new Date();
        
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
        String date1 = sdf1.format(d);
        
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
        String time1 = sdf2.format(d);
        
            Connection con = null;
           try{
               con = DBConnection.getConnect(); 
               con.setAutoCommit(false);
               PreparedStatement ps = con.prepareStatement("insert into contact_us(firstname, lastname, city, subject, date1, time1) values(?,?,?,?,?,?)");
               ps.setString(1, first1);
               ps.setString(2, last1);
               ps.setString(3, country1);
               ps.setString(4, subject1);
               ps.setString(5, date1);
               ps.setString(6, time1);
               
               
               int i = ps.executeUpdate();
               if(i > 0){
                   con.commit();
                   RequestDispatcher rd1 = req.getRequestDispatcher("successfullyApplied.jsp");
                   rd1.include(req, resp);
                   
                   RequestDispatcher rd2 = req.getRequestDispatcher("contactus.jsp");
                   rd2.include(req, resp);
               }
               else{
                    con.rollback();
                   RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                   rd1.include(req, resp);
                   
                   RequestDispatcher rd2 = req.getRequestDispatcher("contactus.jsp");
                   rd2.include(req, resp); 
               }
            }
            catch(Exception e){
                try{
                    con.rollback();
                   RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                   rd1.include(req, resp);
                   
                   RequestDispatcher rd2 = req.getRequestDispatcher("contactus.jsp");
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
