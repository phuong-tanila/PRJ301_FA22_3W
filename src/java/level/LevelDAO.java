/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package level;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtil;

/**
 *
 * @author 15tha
 */
public class LevelDAO {

    private static List<LevelDTO> list;

    public List<LevelDTO> getAll() throws SQLException {
        if (list == null) {
            System.out.println("!@#");
            Connection conn = DBUtil.getConnection();
            PreparedStatement stm = conn.prepareStatement("SELECT [LevelID]\n"
                    + "      ,[Level_Name] \n"
                    + "  FROM [TKK_Piano].[dbo].[Level]");
            ResultSet rs = stm.executeQuery();
            List<LevelDTO> tmpList = new ArrayList<>();
            while (rs.next()) {
                tmpList.add(new LevelDTO(rs.getInt("LevelID"), rs.getString("Level_Name")));
            }
            list = tmpList;
        }
        return list;
    }
    public LevelDTO find(int levelID) throws SQLException{
        return getAll()
                .stream()
                .filter(level -> level.getLevelID() == levelID)
                .findFirst()
                .orElse(null);
    }
    public static void main(String[] args) {
        try {
            System.out.println(new LevelDAO().find(1));
        } catch (SQLException ex) {
            Logger.getLogger(LevelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
