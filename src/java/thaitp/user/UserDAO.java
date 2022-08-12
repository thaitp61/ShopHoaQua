/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import thaitp.constant.AppConstant;
import thaitp.util.DBUtils;

/**
 *
 * @author THAI
 */
public class UserDAO {

    public UserDTO checkLogin(String userID, String password)
            throws SQLException, ClassNotFoundException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT userID, fullName, roleID,address,birthday,phone,email, status FROM tblUsers WHERE userID=? AND password=?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String address = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String status = rs.getString("status");
                    user = new UserDTO(userID, fullName, "", roleID, address, birthday, phone, email, status);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public void signUp(String user, String pass, String name, String email, String phone, String address)
            throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String query = "INSERT INTO tblUsers (userID, password, fullName, roleID, address, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?);";
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(query);
            ptm.setString(1, user);
            ptm.setString(2, pass);
            ptm.setString(3, name);
            ptm.setString(4, AppConstant.Role.USER);
            ptm.setString(5, address);
            ptm.setString(6, phone);
            ptm.setString(7, email);
            ptm.executeUpdate();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

}
