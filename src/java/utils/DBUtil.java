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

/**
 *
 * @author 15tha
 */
public class DBUtil implements Serializable {

//    public static Connection makeConnection() {
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
    public static Connection makeConnection() throws ClassNotFoundException, SQLException {
        Connection conn;
        String url = "jdbc:sqlserver://localhost;databaseName=TKK_Piano;username=sa;password=12345;encrypt=true;trustServerCertificate=true";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection(url);
        return conn;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        System.out.println(makeConnection());
    }
}
