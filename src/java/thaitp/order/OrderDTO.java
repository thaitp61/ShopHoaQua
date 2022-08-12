/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.order;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author THAI
 */
public class OrderDTO implements Serializable {

    private int orderId;
    private String userId;
    private long total;
    private Timestamp orderDate;
    private boolean status;

    public OrderDTO() {
    }

    public OrderDTO(String userId, long total, Timestamp orderDate, boolean status) {
        this.userId = userId;
        this.total = total;
        this.orderDate = orderDate;
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
