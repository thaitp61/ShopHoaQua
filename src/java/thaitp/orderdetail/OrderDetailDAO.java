/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.orderdetail;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import thaitp.cart.CartDetails;
import thaitp.util.DBUtils;

/**
 *
 * @author THAI
 */
public class OrderDetailDAO implements Serializable {

    public boolean addProductToOrder(int orderId, Map<String, CartDetails> items)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "INSERT INTO tblOrderDetail(productID, price, quantity, orderID) "
                        + "VALUES (?, ?, ?, ?)";
                con.setAutoCommit(false);
                for (String key : items.keySet()) {
                    stm = con.prepareStatement(sql);
                    stm.setString(1, key);
                    long price = items.get(key).getPrice();
                    stm.setLong(2, price);
                    int quantity = items.get(key).getAmount();
                    stm.setInt(3, quantity);
                    stm.setInt(4, orderId);
                    stm.executeUpdate();
                }
                con.commit();
                con.setAutoCommit(true);
                return true;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            if (con != null) {
                con.rollback();
            }
            throw ex;
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
