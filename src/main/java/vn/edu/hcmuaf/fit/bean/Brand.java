package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Brand implements Serializable {
    private static final long serialVersionUID = 1L;
    private String Brand;

    public String getBrand() {
        return Brand;
    }

    public void setBrand(String brand) {
        Brand = brand;
    }

    @Override
    public String toString() {
        return "Brand{" +
                "Brand='" + Brand + '\'' +
                '}';
    }
}
