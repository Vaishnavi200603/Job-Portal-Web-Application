/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend;

import ConnectionPooling.DBConnection;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vaish
 */
public class CreateResume extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        try{
            HttpSession session = req.getSession();
            String first2 = (String)session.getAttribute("session_firstName");
            String last2 = (String)session.getAttribute("session_lastName");
            String email2 = (String)session.getAttribute("session_email");

            String address2 = req.getParameter("address1");
            String career2 = req.getParameter("career1");
            String hobbies2 = req.getParameter("hobbies1");
            String dob2 = req.getParameter("dob1");
            String martial2 = req.getParameter("martial1");
            String language2 = req.getParameter("language1");

            //1. Creating PDF File Name
            String resume_pdf_name = email2 + ".pdf";

            //2. Create Documnet class object
            Document document = new Document();

            //3. Get PdfWriter Instance
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(PathDetails.RESUMEBUILDER + resume_pdf_name));
        
            //4. Open Documeny
            document.open();
            
            //5.
            //TITLE
            String fontname = "Arial";
            float fontsize = 18;
            int fontstyle = Font.BOLD;
            Paragraph title = new Paragraph("RESUME", FontFactory.getFont(fontname, fontsize, fontstyle, BaseColor.BLUE));
            document.add(title);
            
            //NAME AND EMAIL
            Paragraph yourname = new Paragraph(first2 + " " + last2);
            document.add(yourname);
            
            Paragraph emptyspace = new Paragraph(" ");
            document.add(emptyspace);
            
            int emailFontSize = 8;
            Paragraph youremail = new Paragraph(email2, FontFactory.getFont(fontname, emailFontSize));
            document.add(youremail);
            
            document.add(emptyspace);
            
            //Career objective
            String co_fontname = "Arial";
            float co_fontsize = 14;
            int co_fontstyle = Font.ITALIC;
            Paragraph careertitle = new Paragraph("Career Objective", FontFactory.getFont(co_fontname, co_fontsize, co_fontstyle, BaseColor.BLACK));
            document.add(careertitle);
            Paragraph career = new Paragraph(career2);
            document.add(career);
            
            document.add(emptyspace);
            
            //Education Qualification
            Paragraph edutitle = new Paragraph("Education Qualification", FontFactory.getFont(co_fontname, co_fontsize, co_fontstyle, BaseColor.BLACK));
            document.add(edutitle);
            
            PdfPTable table = new PdfPTable(4);
            table.setSpacingBefore(20);
            table.setSpacingAfter(20);
            
            PdfPCell c1 = new PdfPCell(new Phrase("Year"));
            table.addCell(c1);
            PdfPCell c2 = new PdfPCell(new Phrase("School/College"));
            table.addCell(c2);
            PdfPCell c3 = new PdfPCell(new Phrase("Degree"));
            table.addCell(c3);
            PdfPCell c4 = new PdfPCell(new Phrase("Grade"));
            table.addCell(c4);
            
            Connection con = null;
            String startyear="", endyear="", school="", degree="", grade="";
            try{
               con = DBConnection.getConnect(); 
               PreparedStatement ps = con.prepareStatement("select * from education where email=?");
               ps.setString(1, email2);
               
               ResultSet rs = ps.executeQuery();
               while(rs.next()){
                   startyear = rs.getString("startYear");
                   endyear = rs.getString("endYear");
                   school = rs.getString("school");
                   degree = rs.getString("degree");
                   grade = rs.getString("grade");
                   
                   table.addCell(startyear + "-" + endyear);
                   table.addCell(school);
                   table.addCell(degree);
                   table.addCell(grade);
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
            finally{
                try{
                   con.close();
                }
                catch(Exception e){
                    e.printStackTrace();
                }
            }
            document.add(table);
            document.add(emptyspace);
            
            //Experience Details
            Paragraph exptitle = new Paragraph("Experience Details", FontFactory.getFont(co_fontname, co_fontsize, co_fontstyle, BaseColor.BLACK));
            document.add(exptitle);
            
            PdfPTable table1 = new PdfPTable(4);
            table1.setSpacingBefore(20);
            table1.setSpacingAfter(20);
            
            PdfPCell e1 = new PdfPCell(new Phrase("Year"));
            table1.addCell(e1);
            PdfPCell e2 = new PdfPCell(new Phrase("Company"));
            table1.addCell(e2);
            PdfPCell e3 = new PdfPCell(new Phrase("Location"));
            table1.addCell(e3);
            PdfPCell e4 = new PdfPCell(new Phrase("Position"));
            table1.addCell(e4);
            
            Connection con1 = null;
            String year1="", company1="", location1="", position1="";
            try{
               con1 = DBConnection.getConnect(); 
               PreparedStatement ps1 = con1.prepareStatement("select * from experience where email=?");
               ps1.setString(1, email2);
               
               ResultSet rs1 = ps1.executeQuery();
               while(rs1.next()){
                   year1 = rs1.getString("year");
                   company1 = rs1.getString("company");
                   location1 = rs1.getString("location");
                   position1 = rs1.getString("position");
                   
                   table1.addCell(year1);
                   table1.addCell(company1);
                   table1.addCell(location1);
                   table1.addCell(position1);
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
            finally{
                try{
                   con1.close();
                }
                catch(Exception e){
                    e.printStackTrace();
                }
            }
            document.add(table1);
            document.add(emptyspace);
            
            //Hobbies
            Paragraph hobbiestitle = new Paragraph("Hobbies", FontFactory.getFont(co_fontname, co_fontsize, co_fontstyle, BaseColor.BLACK));
            document.add(hobbiestitle);
            Paragraph hobbies = new Paragraph(hobbies2);
            document.add(hobbies);
            
            document.add(emptyspace);
            
            //Personal Information
            Paragraph perInfo = new Paragraph("Personal Information", FontFactory.getFont(co_fontname, co_fontsize, co_fontstyle, BaseColor.BLACK));
            document.add(perInfo);
            Paragraph dateOfBirth = new Paragraph("Date Of Birth : " + dob2);
            document.add(dateOfBirth);
            Paragraph  martialStatus = new Paragraph("Matial Status : " + martial2);
            document.add(martialStatus);
            Paragraph lang = new Paragraph("Language Proefiency : " + language2);
            document.add(lang);
            Paragraph address = new Paragraph("Address : " + address2);
            document.add(address);
            
            document.add(emptyspace);
            
            //Declaration
            Paragraph desc = new Paragraph("Declaration", FontFactory.getFont(co_fontname, co_fontsize, co_fontstyle, BaseColor.BLACK));
            document.add(desc);
            Paragraph declaration = new Paragraph("I do hereby declare that the above information is true to the best of my knowledge");
            document.add(declaration);
            
            document.add(emptyspace);
            
            //last phase
            Paragraph name = new Paragraph("Name : " + first2 + " " + last2);
            document.add(name);
            
            Date d = new Date();
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
            
            Paragraph currDate = new Paragraph("Date : " + sdf1.format(d));
            document.add(currDate);
            
            
            //6. Close Document
            document.close();
            
            resp.sendRedirect("profile.jsp");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
