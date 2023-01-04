package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Order implements Serializable {
    private static final long serialVersionUID = 1L;
    private String orderId;
    private String fullName;
    private String phoneNumber;
    private String address;
    private String note;
    private String orderDate;
    private String status;

    public Order() {
    }

    public Order(String orderId, String fullName, String phoneNumber, String address, String note, String orderDate, String status) {
        this.orderId = orderId;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.note = note;
        this.orderDate = orderDate;
        this.status = status;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "orderId= " + orderId + '\'' +
                ", fullName= " + fullName + '\'' +
                ", phoneNumber= " + phoneNumber + '\'' +
                ", address= " + address +
                ", note= " + note +
                ", orderDate= " + orderDate +
                ", status= " + status + '\'' +
                '}';
    }
}
