/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.cart;

import java.io.Serializable;

/**
 *
 * @author THAI
 */
public class CartDetails implements Serializable {

    private String name;
    private int amount;
    private long price;
    private long subTotal;
    private int maxAmount;
    private String cartErr;

    public CartDetails() {
    }

    public CartDetails(String name, int amount, long price, int maxAmount) {
        this.name = name;
        this.amount = amount;
        this.price = price;
        this.subTotal = this.price * this.amount;
        this.maxAmount = maxAmount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
        calculateSubTotal();
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public long getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(long subTotal) {
        this.subTotal = subTotal;
    }

    public void increaseAmount() {
        this.amount += 1;
        calculateSubTotal();
    }

    public void calculateSubTotal() {
        this.subTotal = this.price * this.amount;
    }

    public int getMaxAmount() {
        return maxAmount;
    }

    public void setMaxAmount(int maxAmount) {
        this.maxAmount = maxAmount;
    }

    public String getCartErr() {
        return cartErr;
    }

    public void setCartErr(String cartErr) {
        this.cartErr = cartErr;
    }

}
