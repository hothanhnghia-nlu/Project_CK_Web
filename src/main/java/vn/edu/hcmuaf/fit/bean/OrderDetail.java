package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class OrderDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    private int order_id;
    private String product_id;
    private String name;
    private int quantity;
    private int price;
    private int total;

    public OrderDetail() {
    }

    public OrderDetail(int order_id, String product_id, String name, int quantity, int price, int total) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.total = total;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
