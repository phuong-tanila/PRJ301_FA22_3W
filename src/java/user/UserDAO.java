/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

/**
 *
 * @author 15tha
 */
public class UserDAO {        
    public List<UserDTO> getAll() throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT "
                + "       [UserID]\n"
                + "      ,[Username]\n"
                + "      ,[Password]\n"
                + "      ,[Fullname]\n"
                + "      ,[Phone]\n"
                + "      ,[Email]\n"
                + "      ,[Role]\n"
                + "  FROM [User]");
        ResultSet rs = stm.executeQuery();
        ArrayList<UserDTO> list = new ArrayList<>();
        while(rs.next()) {
            UserDTO u = new UserDTO();
            u.setUserID(rs.getInt("UserID"));
            u.setUsername(rs.getString("Username"));
            u.setPassword(rs.getString("Password"));
            u.setFullName(rs.getString("Fullname"));
            u.setPhone(rs.getString("Phone"));
            u.setEmail(rs.getString("Email"));
            u.setRole(rs.getString("Role"));
            list.add(u);
        }
        rs.close();
        stm.close();
        return list;
    }
    
    public UserDTO find(String userID) throws SQLException {
        return getAll()
                .stream()
                .filter(user -> Integer.toString(user.getUserID()).equals(userID))
                .findFirst()
                .orElse(null);
    }
    
    
    public UserDTO login(String username, String password) throws SQLException{
        return getAll()
                .stream()
                .filter(u -> 
                        u.getUsername().equals(username) 
                        && 
                        u.getPassword().equals(password)
                )
                .findFirst()
                .orElse(null);
    }
    public static void main(String[] args) throws SQLException {
        System.out.println(new UserDAO().login("thanh", "123"));
    }
}
