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

    public boolean create(UserDTO u) throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("insert into [User]\n"
                + "           ([Username]\n"
                + "           ,[Password]\n"
                + "           ,[Fullname]\n"
                + "           ,[Phone]\n"
                + "           ,[Email]\n"
                + "           ,[Role])\n"
                + " values (?, ?, ?, ?, ?, ?)");
        stm.setString(1, u.getUsername());
        stm.setString(2, u.getPassword());
        stm.setString(3, u.getFullName());
        stm.setString(4, u.getPhone());
        stm.setString(5, u.getEmail());
        stm.setString(6, "ST");
        return stm.executeUpdate() == 1;
    }

    public UserDTO findByEmail(String email) throws SQLException {
        return getAll()
                .stream()
                .filter(i -> i.getEmail().equals(email))
                .findFirst()
                .orElse(null);
    }

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
        while (rs.next()) {
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

    public int findID(UserDTO u) throws SQLException {
        UserDTO tmpUser = getAll()
                .stream()
                .filter(user -> user.getFullName().equals(u.getFullName()) && user.getUsername().equals(u.getUsername()))
                .findFirst()
                .orElse(null);
        if (tmpUser != null) {
            return tmpUser.getUserID();
        }
        return -1;
    }

    public UserDTO find(String userID) throws SQLException {
        return getAll()
                .stream()
                .filter(user -> Integer.toString(user.getUserID()).equals(userID))
                .findFirst()
                .orElse(null);
    }

    public UserDTO login(String username, String password) throws SQLException {
        return getAll()
                .stream()
                .filter(u
                        -> u.getUsername().equals(username)
                && u.getPassword().equals(password)
                )
                .findFirst()
                .orElse(null);
    }

    public static void main(String[] args) throws SQLException {
        UserDTO u = new UserDTO();
        u.setUsername("THanhDAOooo");
        u.setFullName("Dao Duc Thanh");
        u.setEmail("15thanh09@gmail.com");
        u.setPhone("0369998759");
        u.setPassword("1");
        System.out.println(new UserDAO().findID(u));
    }
}
