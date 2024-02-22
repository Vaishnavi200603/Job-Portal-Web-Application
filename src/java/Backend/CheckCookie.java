/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vaish
 */
public class CheckCookie extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email="";
        Cookie[] ck = req.getCookies();
        if(ck != null){
            for(Cookie cookie : ck){
                if(cookie.getName().equals("cookie_email")){
                    email = cookie.getValue();
                    req.setAttribute("email1", email);
                    RequestDispatcher rs = req.getRequestDispatcher("login");
                    rs.include(req, resp);
                    
                }
            }
        }    
    }
}
