/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ConnectionPooling;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author vaish
 */
public class DBConnection {
    static Connection con;
    static{
        try{
           Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    public static Connection getConnect(){
        try{
            MysqlDataSource ds = new MysqlDataSource();
            ds.setURL("jdbc:mysql://localhost:3306/jobportal?useSSL=false");
            ds.setUser("root");
            ds.setPassword("student");
            
            con = ds.getConnection();
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return con;
    }
}
