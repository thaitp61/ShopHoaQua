/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import thaitp.util.DBUtils;

/**
 *
 * @author THAI
 */
public class OrderDAO {

    public int addNewOrder(OrderDTO dto)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "INSERT INTO tblOrder (orderDate, userID, total, status) "
                    + "OUTPUT Inserted.orderID AS orderID "
                    + "VALUES(?, ?, ?, ?)";
            stm = con.prepareStatement(sql);
            stm.setTimestamp(1, dto.getOrderDate());
            stm.setString(2, dto.getUserId());
            stm.setLong(3, dto.getTotal());
            stm.setBoolean(4, dto.getStatus());
            boolean result = stm.execute();
            if (result) {
                rs = stm.getResultSet();
                if (rs.next()) {
                    int orderId = rs.getInt("orderID");
                    return orderId;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return -1;
    }

    public boolean updateOrderStatus(int orderId, boolean status)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtils.getConnection();
            String sql = "UPDATE tblOrder SET status = ? "
                    + "WHERE orderID = ?";
            stm = con.prepareStatement(sql);
            stm.setBoolean(1, status);
            stm.setInt(2, orderId);
            int row = stm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
