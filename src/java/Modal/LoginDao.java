package Modal;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author shobhit
 */
public class LoginDao {

    public static boolean[] validate(String uname,String pass){
       boolean status = false,adminflag = false; 
        boolean flags[] = new boolean[2];
       try{ 
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Quench?useSSL=true&verifyServerCertificate=false&allowMultiQueries=true","root","1810");
        PreparedStatement ps = con.prepareStatement("Select * from register where userName=? and pass=?");
        ps.setString(1,uname);
        ps.setString(2,pass);
        ResultSet rs = ps.executeQuery();
        status = rs.next();
        String usertype = rs.getString("userType");
        if(usertype.equals("admin"))
            adminflag = true;
        flags[0] = status;
        flags[1] = adminflag;
        System.out.println("chk "+status);
       }
       catch(Exception e){
           System.out.println(e);
         }
       return flags;
    }
}
