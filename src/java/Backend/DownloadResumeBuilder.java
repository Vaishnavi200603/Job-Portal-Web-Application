/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vaish
 */
public class DownloadResumeBuilder extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String fileName = req.getParameter("fn");
        resp.setHeader("Content-Disposition", "attachment; filename=\""+fileName);
        
        FileInputStream fis = new FileInputStream(PathDetails.RESUMEBUILDER + fileName);
        int i;
        while((i=fis.read()) != -1){
            out.write(i);
        }
        fis.close();
        out.close();
    }
}
