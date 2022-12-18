package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Product implements Serializable {
    String productID;
    String cat_id;
    String name;
    String brand;
    String image;
    String discription;
    int price;
    int  discount;

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getCat_id() {
        return cat_id;
    }

    public void setCat_id(String cat_id) {
        this.cat_id = cat_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public  int getDiscount() {
        return discount;
    }

    public void setDiscount( int  discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productID='" + productID + '\'' +
                ", cat_id='" + cat_id + '\'' +
                ", name='" + name + '\'' +
                ", brand='" + brand + '\'' +
                ", image='" + image + '\'' +
                ", discription='" + discription + '\'' +
                ", price=" + price +
                ", discount=" + discount +
                '}';
    }
}
