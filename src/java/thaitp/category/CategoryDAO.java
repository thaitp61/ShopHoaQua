/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import thaitp.util.DBUtils;

/**
 *
 * @author THAI
 */
public class CategoryDAO {

    public List<CategoryDTO> getAll()
            throws SQLException, ClassNotFoundException {
        List<CategoryDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String query = "SELECT c.catagoryID, c.catagoryName "
                + "FROM tblCatagory c ";
        try {
            conn = DBUtils.getConnection();
            if (Objects.nonNull(conn)) {
                ptm = conn.prepareStatement(query);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String categoryId = rs.getString("catagoryID");
                    String categoryName = rs.getString("catagoryName");
                    CategoryDTO categoryDTO = new CategoryDTO(categoryId, categoryName);
                    list.add(categoryDTO);
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
        return list;
    }
}
