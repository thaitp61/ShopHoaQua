/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import javax.naming.NamingException;
import thaitp.cart.CartDetails;
import thaitp.category.CategoryDTO;
import thaitp.util.DBUtils;

/**
 *
 * @author THAI
 */
public class ProductDAO {
    
    private static final String DELETE = "UPDATE tblProduct SET status=0 WHERE productID=?";
    private static final String UPDATE = "UPDATE tblProduct SET productName=?, image=?, price=?, quantity=?, catagoryID=?, importDate=?, usingDate=?, description=? WHERE productID=?";
    private static final String INSERT = "INSERT INTO tblProduct (productName, price, quantity, catagoryID, importDate, usingDate, description, productID, [status]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1)";
    
    public List<ProductDTO> getAllProduct(String searchText)
            throws SQLException, ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String query = "SELECT productID, productName, image, price, quantity, "
                + "importDate, usingDate, description, "
                + "c.catagoryID, c.catagoryName "
                + "FROM tblProduct p "
                + "INNER JOIN tblCatagory c "
                + "ON c.catagoryID = p.catagoryID "
                + "WHERE productName LIKE ? "
                + "AND [status] = 1";
        try {
            conn = DBUtils.getConnection();
            if (Objects.nonNull(conn)) {
                ptm = conn.prepareStatement(query);
                ptm.setString(1, "%" + searchText + "%");
                //ptm.setString(2, "%" + searchText + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    long price = rs.getLong("price");
                    int quantity = rs.getInt("quantity");
                    // String catagoryID = rs.getString("catagoryID");
                    Timestamp importDate = rs.getTimestamp("importDate");
                    Timestamp usingDate = rs.getTimestamp("usingDate");
                    String description = rs.getString("description");
                    String categoryId = rs.getString("catagoryID");
                    String categoryName = rs.getString("catagoryName");
                    CategoryDTO categoryDTO = new CategoryDTO(categoryId, categoryName);
                    list.add(new ProductDTO(productID, productName, image, price, quantity, importDate, usingDate, description, categoryDTO));
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
    
    public boolean delete(String productID)
            throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = thaitp.util.DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean insert(ProductDTO product)
            throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = thaitp.util.DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, product.getProductName());
                ptm.setLong(2, product.getPrice());
                ptm.setInt(3, product.getQuantity());
                ptm.setString(4, product.getCategory().getId());
                ptm.setTimestamp(5, product.getImportDate());
                ptm.setTimestamp(6, product.getUsingDate());
                ptm.setString(7, product.getDescription());
                ptm.setString(8, product.getProductId());
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean update(ProductDTO product)
            throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = thaitp.util.DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getProductName());
                ptm.setString(2, product.getImage());
                ptm.setLong(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());
                ptm.setString(5, product.getCategory().getId());
                ptm.setTimestamp(6, product.getImportDate());
                ptm.setTimestamp(7, product.getUsingDate());
                ptm.setString(8, product.getDescription());
                ptm.setString(9, product.getProductId());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public ProductDTO getProductInfo(String id)
            throws SQLException, ClassNotFoundException {
        ProductDTO result = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String query = "SELECT productID, productName, image, price, quantity, "
                + "importDate, usingDate, description, [status], "
                + "c.catagoryID, c.catagoryName "
                + "FROM tblProduct p "
                + "INNER JOIN tblCatagory c "
                + "ON c.catagoryID = p.catagoryID "
                + "WHERE productID = ?";
        try {
            conn = DBUtils.getConnection();
            if (Objects.nonNull(conn)) {
                ptm = conn.prepareStatement(query);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    long price = rs.getLong("price");
                    int quantity = rs.getInt("quantity");
                    boolean status = rs.getBoolean("status");
                    // String catagoryID = rs.getString("catagoryID");
                    Timestamp importDate = rs.getTimestamp("importDate");
                    Timestamp usingDate = rs.getTimestamp("usingDate");
                    String description = rs.getString("description");
                    String categoryId = rs.getString("catagoryID");
                    String categoryName = rs.getString("catagoryName");
                    CategoryDTO categoryDTO = new CategoryDTO(categoryId, categoryName);
                    result = new ProductDTO(productID, productName, image, price, quantity, importDate, usingDate, description, categoryDTO);
                    result.setStatus(status);
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
        return result;
    }
    
    public boolean updateProductQuantity(Map<String, CartDetails> items)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "UPDATE tblProduct "
                        + "SET quantity = (SELECT quantity FROM tblProduct WHERE productId = ? ) - ? "
                        + "OUTPUT Inserted.quantity AS newQuantity "
                        + "WHERE productId = ?";
                con.setAutoCommit(false);
                for (String key : items.keySet()) {
                    stm = con.prepareStatement(sql);
                    stm.setString(1, key);
                    int quantity = items.get(key).getAmount();
                    stm.setInt(2, quantity);
                    stm.setString(3, key);
                    boolean result = stm.execute();
                    if (result) {
                        rs = stm.getResultSet();
                        if (rs.next()) {
                            int newQuantity = rs.getInt("newQuantity");
                            if (newQuantity < 0) {
                                throw new SQLException("Quantity cannot be negative");
                            }
                        }
                    }
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
        return false;
    }
    
}
