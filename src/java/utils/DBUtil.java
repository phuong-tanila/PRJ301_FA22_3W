/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
//import org.apache.c

/**
 *
 * @author 15tha
 */
public class DBUtil implements Serializable {

//    public static Connection getConnection() {
//        Connection conn = null;
//        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            System.out.println(ds);
//            conn = ds.getConnection();
//            return conn;
//        } catch (NamingException | SQLException ex) {
//            Logger.getLogger(DBUtil.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        System.out.println(conn);
//        return conn;
//    }
    public static Connection getConnection() {

        try {
            Connection conn;
            String url = "jdbc:sqlserver://localhost;databaseName=TKK_Piano;username=sa;password=12345;encrypt=true;trustServerCertificate=true";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url);
            return conn;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBUtil.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {

//        java.util.Date date = new java.util.Date("15/12/2022");
//        System.out.println(new java.sql.Date(date.getTime()));
        SimpleDateFormat clientFormat = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat serverFormat = new SimpleDateFormat("YYYY-MM-DD");
        Date d = null;
        try {
            d = clientFormat.parse("19/12/2022");
            System.out.println("a " + new java.sql.Date(d.getTime()));
        } catch (ParseException ex) {
            Logger.getLogger(DBUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(d);
    }
}
