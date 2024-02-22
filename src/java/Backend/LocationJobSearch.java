/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import ConnectionPooling.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vaish
 */
public class LocationJobSearch extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String loc1 = req.getParameter("location");
        
        Connection con = null;
        String id="",  job_profile="", company="", experience="", date1="", time1="", time_venue="", job_location="";
        try{
            con = DBConnection.getConnect();
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement("select * from jobs where job_location LIKE '%"+loc1+"%' ");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                id = rs.getString("id");
                job_profile = rs.getString("job_profile");
                company = rs.getString("company");
                experience = rs.getString("experience");
                time_venue = rs.getString("time_venue");
                date1 = rs.getString("date1");
                time1 = rs.getString("time1");
                job_location = rs.getString("job_location");
                
                out.println("JOB PROFILE : " + job_profile);
                out.println("COMPANY : " + company);
                out.println("LOCATION : " + job_location);
                out.println("EXPERIENCE : " + experience);
                out.println("TIME VENUE : " + time_venue + "-" + date1 + " " + time1);
            }
        }   
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
