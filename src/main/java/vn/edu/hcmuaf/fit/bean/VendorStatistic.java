package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class VendorStatistic implements Serializable {
    private static final long serialVersionUID = 1L;
    private String vendorID;
    private String name;
    private String  quantity;

    private String price;

    public VendorStatistic() {
    }

    public VendorStatistic(String vendorID, String name, String quantity, String price) {
        this.vendorID = vendorID;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }

    public String getVendorID() {
        return vendorID;
    }

    public void setVendorID(String vendorID) {
        this.vendorID = vendorID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "VendorStatistic{" +
                "vendorID='" + vendorID + '\'' +
                ", name='" + name + '\'' +
                ", quantity='" + quantity + '\'' +
                ", price='" + price + '\'' +
                '}';
    }
}
