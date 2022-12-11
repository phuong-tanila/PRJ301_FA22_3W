/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order_item;

import course.CourseDAO;
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
public class OrderItemDAO {

    public List<OrderItemDTO> getAll(int orderID) throws SQLException {
        String sql = "SELECT [OrderID]\n"
                + "      ,[CourseID]\n"
                + "      ,[Quantity]\n"
                + "      ,[Price]\n"
                + "  FROM [Order_Detail]";
        Connection conn = DBUtil.getConnection();

        PreparedStatement stm = conn.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        List<OrderItemDTO> list = new ArrayList<>();
        while (rs.next()) {
            OrderItemDTO o = new OrderItemDTO();
            o.setOrderID(rs.getInt("OrderID"));
            o.setCourseID(rs.getInt("CourseID"));
            o.setQuantity(rs.getInt("quantity"));
            o.setPrice(rs.getInt("price"));
            list.add(o);
        }
        return list;
    }

    public boolean create(OrderItemDTO o) throws SQLException {
        String sql = "insert into Order_Detail\n"
                + "(OrderID, CourseID, Quantity, Price)\n"
                + "values (?, ?, ?, ?)";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement(sql);
        stm.setInt(1, o.getOrderID());
        stm.setInt(2, o.getCourseID());
        stm.setInt(3, o.getQuantity());
        stm.setDouble(4, o.getPrice());
        return stm.executeUpdate() == 1;
    }
    public static void main(String[] args) {
        OrderItemDAO oiDAO = new OrderItemDAO();
        OrderItemDTO o = new OrderItemDTO();
        o.setOrderID(1);
        o.setCourseID(3);
        try {
            System.out.println(oiDAO.create(o));
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
