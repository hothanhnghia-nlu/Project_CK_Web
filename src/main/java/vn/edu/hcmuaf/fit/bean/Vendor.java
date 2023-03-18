package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Vendor implements Serializable {
    private static final long serialVersionUID = 1L;
    private String vendorID;
    private String name;
    private int  status;

    public Vendor() {
    }

    public Vendor(String vendorID, String name, int status) {
        this.vendorID = vendorID;
        this.name = name;
        this.status = status;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Vendor{" +
                "vendorID='" + vendorID + '\'' +
                ", name='" + name + '\'' +
                ", status=" + status +
                '}';
    }
}
