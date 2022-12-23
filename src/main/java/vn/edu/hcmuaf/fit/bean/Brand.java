package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Brand implements Serializable {
    private static final long serialVersionUID = 1L;
    private String brand;

    public Brand() {
    }

    public Brand(String brand) {
        this.brand = brand;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    @Override
    public String toString() {
        return "Brand{" +
                "Brand='" + brand + '\'' +
                '}';
    }
}
