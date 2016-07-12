package com.g2d.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class Order {

    private int id;
    private Customer customer;
    private Date createdTime;
    private String receiverName;
    private String receiverEmail;
    private String receiverAddress;
    private String receiverPhone;

    private double totalAmount;

    private int status;//{0:新訂單, 1:已通知...}

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    private List<OrderItem> orderItemList;

    public void add(OrderItem item) {
        if (orderItemList == null) {
            orderItemList = new ArrayList<>();
        }
        orderItemList.add(item);
    }

    public void add(ShoppingCart cart) throws Go2DrinkException {
        if (customer == null) {
            throw new Go2DrinkException("請先指派客戶資料");
        }

        for (Product p : cart.keySet()) {
            OrderItem item = new OrderItem();
            item.setProduct(p);
            item.setIce(p.getIce());
            item.setSugar(p.getSugar());
            if (p.getTopping() != null) {
                item.setTopping(p.getTopping());
            } else {
                item.setTopping("無");
            }
            item.setQuantity(cart.getQuantity(p));
            item.setPrice(p.getUntiPrice());

            this.add(item);
        }
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the customer
     */
    public Customer getCustomer() {
        return customer;
    }

    /**
     * @param customer the customer to set
     */
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    /**
     * @return the createdTime
     */
    public Date getCreatedTime() {
        
        
                
        return createdTime;
    }

    /**
     * @param createdTime the createdTime to set
     */
    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    /**
     * @return the receiverName
     */
    public String getReceiverName() {
        return receiverName;
    }

    /**
     * @param receiverName the receiverName to set
     */
    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    /**
     * @return the receiverEmail
     */
    public String getReceiverEmail() {
        return receiverEmail;
    }

    /**
     * @param receiverEmail the receiverEmail to set
     */
    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    /**
     * @param receiverPhone the receiverPhone to set
     */
    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    /**
     * @return the totalAmount
     */
    public double getTotalAmount() {
        if (orderItemList == null || orderItemList.isEmpty()) {
            return totalAmount;
        } else {
            double sum = 0;
            for (OrderItem item : orderItemList) {
                sum += item.getPrice() * item.getQuantity();
            }
            return sum;
        }
    }

    /**
     * @param totalAmount the totalAmount to set
     */
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    /**
     * @return the orderItemList
     */
    public List<OrderItem> getOrderItemList() {
        return Collections.unmodifiableList(orderItemList);
    }

}
