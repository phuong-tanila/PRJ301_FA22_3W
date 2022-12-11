/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import level.LevelDTO;
import utils.DBUtil;

/**
 *
 * @author 15tha
 */
public class CategoryDAO {

    private static List<CategoryDTO> list;

    public List<CategoryDTO> getAll() throws SQLException {
        if (list == null) {
            System.out.println("!@#");
            Connection conn = DBUtil.getConnection();
            PreparedStatement stm = conn.prepareStatement("SELECT [CategoryID]\n"
                    + "      ,[Category_Name]\n"
                    + "  FROM [TKK_Piano].[dbo].[Category]");
            ResultSet rs = stm.executeQuery();
            List<CategoryDTO> tmpList = new ArrayList<>();
            while (rs.next()) {
                tmpList.add(new CategoryDTO(rs.getInt("CategoryID"), rs.getString("Category_Name")));
            }
            list = tmpList;
        }
        return list;
    }

    public CategoryDTO find(int cateID) throws SQLException {
        return getAll()
                .stream()
                .filter(c -> c.getCateID() == cateID)
                .findFirst()
                .orElse(null);
    }

    public static void main(String[] args) {
        try {
            System.out.println(new CategoryDAO().getAll());
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
