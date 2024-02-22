/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import ConnectionPooling.DBConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author vaish
 */
public class UpdateResume extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String file_name = null;
        try{
           DiskFileItemFactory factory = new DiskFileItemFactory();
           ServletFileUpload sfu = new ServletFileUpload(factory);
           List<FileItem> items = sfu.parseRequest(req);
           FileItem item = items.get(0);
           String file_path = item.getName();
           File file = new File(file_path);
           file_name = file.getName();
           File f1 = new File(PathDetails.RESUMEPATH + file_name);
           item.write(f1);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        HttpSession session = req.getSession();
        String email2 = (String)session.getAttribute("session_email");
        Connection con = null;
        try{
           con = DBConnection.getConnect();
           con.setAutoCommit(false);
           
           PreparedStatement ps1 = con.prepareStatement("select * from resumes where email=?");
           ps1.setString(1, email2);
           
           ResultSet rs = ps1.executeQuery();
           if(rs.next()){
               //update query
               PreparedStatement ps2 = con.prepareStatement("update resumes set path=? where email=?");
               ps2.setString(1, file_name);
               ps2.setString(2, email2);
               
               int i1 = ps2.executeUpdate();
               if(i1 > 0){
                   con.commit();
                   resp.sendRedirect("profile.jsp");
               }
               else{
                  con.rollback();
                  RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                  rd1.include(req, resp);
                  
                  RequestDispatcher rd2 = req.getRequestDispatcher("uploadResume.jsp");
                  rd2.include(req, resp);
               }
               
           }
           else{
               //insert query
               PreparedStatement ps3 = con.prepareStatement("insert into resumes(email, path) values(?,?)");
               ps3.setString(1, email2);
               ps3.setString(2, file_name);
               
               int i1 = ps3.executeUpdate();
               if(i1 > 0){ 
                   con.commit();
                   resp.sendRedirect("profile.jsp");
               }
               else{
                  con.rollback();
                  RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                  rd1.include(req, resp);
                  
                  RequestDispatcher rd2 = req.getRequestDispatcher("uploadResume.jsp");
                  rd2.include(req, resp);
               }
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
                  
            RequestDispatcher rd2 = req.getRequestDispatcher("uploadResume.jsp");
            rd2.include(req, resp);
            
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
