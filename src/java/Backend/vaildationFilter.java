/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author vaish
 */
public class vaildationFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String first2 = request.getParameter("first1");
        String last2 = request.getParameter("last1");
        String email2 = request.getParameter("email1");
        String pass2 = request.getParameter("pass1");
        String gender2 = request.getParameter("gender1");
        String city2 = request.getParameter("city1");
        
        ValidationServerSide validation = new ValidationServerSide();
        
        if(!validation.firstValidate(first2)){
            RequestDispatcher rd1 = request.getRequestDispatcher("header.jsp");
            rd1.include(request, response);
               
            RequestDispatcher rd2 = request.getRequestDispatcher("loginError.jsp");
            rd2.include(request, response);
               
            RequestDispatcher rd3 = request.getRequestDispatcher("registerDiv.jsp");
            rd3.include(request, response);
               
            RequestDispatcher rd4 = request.getRequestDispatcher("footer.jsp");
            rd4.include(request, response);
        }
        else if(!validation.lastValidate(last2)){
            RequestDispatcher rd1 = request.getRequestDispatcher("header.jsp");
            rd1.include(request, response);
               
            RequestDispatcher rd2 = request.getRequestDispatcher("loginError.jsp");
            rd2.include(request, response);
               
            RequestDispatcher rd3 = request.getRequestDispatcher("registerDiv.jsp");
            rd3.include(request, response);
               
            RequestDispatcher rd4 = request.getRequestDispatcher("footer.jsp");
            rd4.include(request, response);
        }
        else if(!validation.emailValidate(email2)){
            RequestDispatcher rd1 = request.getRequestDispatcher("header.jsp");
            rd1.include(request, response);
               
            RequestDispatcher rd2 = request.getRequestDispatcher("loginError.jsp");
            rd2.include(request, response);
               
            RequestDispatcher rd3 = request.getRequestDispatcher("registerDiv.jsp");
            rd3.include(request, response);
               
            RequestDispatcher rd4 = request.getRequestDispatcher("footer.jsp");
            rd4.include(request, response);
        }
        else if(!validation.passwordValidate(pass2)){
            RequestDispatcher rd1 = request.getRequestDispatcher("header.jsp");
            rd1.include(request, response);
               
            RequestDispatcher rd2 = request.getRequestDispatcher("loginError.jsp");
            rd2.include(request, response);
               
            RequestDispatcher rd3 = request.getRequestDispatcher("registerDiv.jsp");
            rd3.include(request, response);
               
            RequestDispatcher rd4 = request.getRequestDispatcher("footer.jsp");
            rd4.include(request, response);
        }
        else if(gender2==null || gender2.equals("")){
            RequestDispatcher rd1 = request.getRequestDispatcher("header.jsp");
            rd1.include(request, response);
               
            RequestDispatcher rd2 = request.getRequestDispatcher("loginError.jsp");
            rd2.include(request, response);
               
            RequestDispatcher rd3 = request.getRequestDispatcher("registerDiv.jsp");
            rd3.include(request, response);
               
            RequestDispatcher rd4 = request.getRequestDispatcher("footer.jsp");
            rd4.include(request, response);
        }
        else if(city2==null || city2.equals("")){
            RequestDispatcher rd1 = request.getRequestDispatcher("header.jsp");
            rd1.include(request, response);
               
            RequestDispatcher rd2 = request.getRequestDispatcher("loginError.jsp");
            rd2.include(request, response);
               
            RequestDispatcher rd3 = request.getRequestDispatcher("registerDiv.jsp");
            rd3.include(request, response);
               
            RequestDispatcher rd4 = request.getRequestDispatcher("footer.jsp");
            rd4.include(request, response);
        }
        else{
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        
    }
    
}
