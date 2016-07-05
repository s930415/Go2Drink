package com.g2d.domain;

public class OrderItem {

    private int orderId;
    private Product product;
    private double price;
    private int quantity;
    private String topping;
    private String sugar;
    private String ice;

    /**
     * @return the orderId
     */
    public int getOrderId() {
        return orderId;
    }

    /**
     * @param orderId the orderId to set
     */
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    /**
     * @return the product
     */
    public Product getProduct() {
        return product;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(Product product) {
        this.product = product;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getTopping() {
        return topping;
    }

    public void setTopping(String topping) {
        if (topping == null) {
            this.topping = "無";
        } else {
            this.topping = topping;
        }
    }

    public String getSugar() {
        return sugar;
    }

    public void setSugar(String sugar) {
        if (sugar == null) {
            this.sugar = "正常";
        } else {
            this.sugar = sugar;
        }
    }

    public String getIce() {
        return ice;
    }

    public void setIce(String ice) {
        if (ice == null) {
            this.ice = "正常";
        } else {
            this.ice = ice;
        }
    }

}
