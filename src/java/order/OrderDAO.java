/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import order_item.OrderItemDAO;
import order_item.OrderItemDTO;
import utils.DBUtil;

/**
 *
 * @author 15tha
 */
public class OrderDAO {
    
    private static List<OrderDTO> list;
    
    public List<OrderDTO> findAll() throws SQLException {
        if (list == null || list.size() != count()) {
            Connection conn = DBUtil.getConnection();
            PreparedStatement stm = conn.prepareStatement("SELECT [OrderID]\n"
                    + "      ,[UserID]\n"
                    + "      ,[Buy_Date]\n"
                    + "      ,[Total_Price]\n"
                    + "      ,[Payment_Method]\n"
                    + "      ,[Payment_Status]\n"
                    + "  FROM [TKK_Piano].[dbo].[Order]");
            ResultSet rs = stm.executeQuery();
            List<OrderDTO> tmpList = new ArrayList<>();
            while (rs.next()) {
                OrderDTO order = new OrderDTO();
                order.setOrderID(rs.getInt("OrderID"));
                order.setUserID(rs.getInt("UserID"));
                order.setBuyDate(rs.getDate("Buy_Date"));
                order.setPaymentMethod(rs.getString("Payment_Method"));
                order.setPaymentStatus(rs.getString("Payment_Status"));
                tmpList.add(order);
            }
            list = tmpList;
        }
        return list;
    }
    
    public List<OrderDTO> findAllOrderByUser(int userId) throws SQLException {
        if (list == null || list.size() != count()) {
            Connection conn = DBUtil.getConnection();
            PreparedStatement stm = conn.prepareStatement("SELECT [OrderID]\n"
                    + "      ,[UserID]\n"
                    + "      ,[Buy_Date]\n"
                    + "      ,[Total_Price]\n"
                    + "      ,[Payment_Method]\n"
                    + "      ,[Payment_Status]\n"
                    + "  FROM [TKK_Piano].[dbo].[Order]"
                    + "  Where UserID = ?");
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            List<OrderDTO> tmpList = new ArrayList<>();
            while (rs.next()) {
                OrderDTO order = new OrderDTO();
                order.setOrderID(rs.getInt("OrderID"));
                order.setUserID(rs.getInt("UserID"));
                order.setBuyDate(rs.getDate("Buy_Date"));
                order.setTotalPrice(rs.getInt("Total_Price"));
                order.setPaymentMethod(rs.getString("Payment_Method"));
                order.setPaymentStatus(rs.getString("Payment_Status"));
                order.setItems(new OrderItemDAO().getAllWithCourse(userId));
                tmpList.add(order);
            }
            list = tmpList;
        }
        return list;
    }
    
    public boolean createOrder(OrderDTO o) throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("INSERT INTO [Order]\n"
                + "           ([UserID]\n"
                + "           ,[Buy_Date]\n"
                + "           ,[Total_Price]\n"
                + "           ,[Payment_Method]\n"
                + "           ,[Payment_Status])\n"
                + "     VALUES\n"
                + "(?, ?, ?, ?, ?)");
        stm.setInt(1, o.getUserID());
        stm.setDate(2, new java.sql.Date(o.getBuyDate().getTime()));
        stm.setInt(3, o.getTotalPrice());
        stm.setString(4, o.getPaymentMethod());
        stm.setString(5, o.getPaymentStatus());
        OrderItemDAO orderItemDAO = new OrderItemDAO();
        if (stm.executeUpdate() == 1) {
            for (OrderItemDTO item : o.getItems()) {
                int createdOrderID = getCreatedOrderID(o);
                if (createdOrderID == -1) {
                    return false;
                }
                item.setOrderID(createdOrderID);
                orderItemDAO.create(item);
            }
            return true;
        }
        return false;
    }
    
    public int getCreatedOrderID(OrderDTO o) throws SQLException {
        String sql = "SELECT [OrderID]\n"
                + "  FROM [TKK_Piano].[dbo].[Order]\n"
                + " where [UserID] = ? "
                + " and [Buy_Date] = ? "
                + " and [Total_Price] = ?"
                + " and [Payment_Method] = ?"
                + " and [Payment_Status] = ?";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement(sql);
        stm.setInt(1, o.getUserID());
        stm.setDate(2, new java.sql.Date(o.getBuyDate().getTime()));
        stm.setInt(3, o.getTotalPrice());
        stm.setString(4, o.getPaymentMethod());
        stm.setString(5, o.getPaymentStatus());
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt("OrderID");
        }
        return -1;
    }
    
    public int count() throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT count([OrderID])\n"
                + "  FROM [TKK_Piano].[dbo].[Order]");
        ResultSet rs = stm.executeQuery();
        if(rs.next())
            return rs.getInt(1);
        
        return -1;
    }
    
    public static void main(String[] args) {
        OrderDAO oDAO = new OrderDAO();
        try {
            System.out.println(oDAO.findAllOrderByUser(1).get(0).getItems().get(0).getCourse().getCourseName());
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
