/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author THAI
 */
public class CartEntity implements Serializable {

    private Map<String, CartDetails> items;
    private long total;
    private int amount;

    public Map<String, CartDetails> getItems() {
        return items;
    }

    public boolean addItemToCart(String productId, String name, long price, int maxAmount) {
        // 1. Check existed items
        if (this.items == null) {
            this.items = new HashMap<>();
        }

        int newAmount = 1;
        CartDetails detail = new CartDetails(name, 0, price, maxAmount);

        // 2. Check existed product
        if (this.items.containsKey(productId)) {
            detail = this.items.get(productId);
            newAmount += detail.getAmount();
        }
        if (newAmount <= maxAmount) {
            detail.increaseAmount();
            detail.calculateSubTotal();
            detail.setMaxAmount(maxAmount);
            detail.setCartErr("");
            this.items.put(productId, detail);
            this.calculateAmountAndTotal();
            return true;
        } else {
            return false;
        }
    }

    public void removeItemFromCart(String id) {
        // 1. Check existed items
        if (this.items == null) {
            return;
        }

        // 2. Check existed product
        if (this.items.containsKey(id)) {
            this.items.remove(id);
            if (this.items.isEmpty()) {
                this.items = null;
            } else {
                this.calculateAmountAndTotal();
            }
        }
    }

    public void updateAmount(String productId, int newAmount, int maxAmount) {
        // 1. Check existed items
        if (this.items == null) {
            return;
        }
        if (newAmount == 0) {
            removeItemFromCart(productId);
            return;
        }
        if (this.items.containsKey(productId)) {
            CartDetails detail = this.items.get(productId);
            detail.setAmount(newAmount);
            detail.calculateSubTotal();
            detail.setMaxAmount(maxAmount);
            detail.setCartErr("");
            this.calculateAmountAndTotal();
        }
    }

    public void updateItem(String productId, CartDetails detail) {
        // 1. Check existed items
        if (this.items == null) {
            return;
        }
        if (this.items.containsKey(productId)) {
            this.items.put(productId, detail);
        }
    }

    public void calculateAmountAndTotal() {
        this.total = 0;
        this.amount = 0;
        if (this.items != null) {
            for (String key : this.items.keySet()) {
                CartDetails detail = this.items.get(key);
                this.total += detail.getSubTotal();
                this.amount += detail.getAmount();

            }
        }
    }

    public void setAmountError(String productId, String message) {
        if (this.items.containsKey(productId)) {
            CartDetails detail = this.items.get(productId);
            detail.setCartErr(message);
        }
    }

    public void clearAmountError(int productId) {
        if (this.items.containsKey(productId)) {
            CartDetails detail = this.items.get(productId);
            detail.setCartErr("");
        }
    }

    public long getTotal() {
        return total;
    }

    public int getAmount() {
        return amount;
    }

    public boolean checkValidCart() {
        if (this.items != null) {
            for (String key : this.items.keySet()) {
                CartDetails detail = this.items.get(key);
                if (!detail.getCartErr().equals("")) {
                    return false;
                }
            }
        } else {
            return false;
        }
        return true;
    }

}
