/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.product;

import java.sql.Timestamp;
import thaitp.category.CategoryDTO;

/**
 *
 * @author THAI
 */
public class ProductDTO {

    private String productId;
    private String productName;
    private String image;
    private long price;
    private int quantity;
    private Timestamp importDate;
    private Timestamp usingDate;
    private String description;
    private CategoryDTO category;
    private boolean status;

    public ProductDTO(String productId, String productName, String image, long price, int quantity, Timestamp importDate, Timestamp usingDate, String description) {
        this.productId = productId;
        this.productName = productName;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.importDate = importDate;
        this.usingDate = usingDate;
        this.description = description;
    }

    public ProductDTO(String productId, String productName, String image, long price, int quantity, Timestamp importDate, Timestamp usingDate, String description, CategoryDTO category) {
        this.productId = productId;
        this.productName = productName;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.importDate = importDate;
        this.usingDate = usingDate;
        this.description = description;
        this.category = category;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp getImportDate() {
        return importDate;
    }

    public void setImportDate(Timestamp importDate) {
        this.importDate = importDate;
    }

    public Timestamp getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(Timestamp usingDate) {
        this.usingDate = usingDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public CategoryDTO getCategory() {
        return category;
    }

    public void setCategory(CategoryDTO category) {
        this.category = category;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
}
