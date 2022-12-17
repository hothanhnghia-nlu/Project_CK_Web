package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Product implements Serializable {

    private static final long ID = 1 ;
    private String NameProduct;
    private int idCategory;
    private double price;
    private int amountProduct;
    private int amountSoldProduct ;
    private int sale;
    private  int New;
    private  int blockProduct;
    private String producer;
    private String discription;

    public String getNameProduct() {
        return NameProduct;
    }

    public void setNameProduct(String nameProduct) {
        NameProduct = nameProduct;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAmountProduct() {
        return amountProduct;
    }

    public void setAmountProduct(int amountProduct) {
        this.amountProduct = amountProduct;
    }

    public int getAmountSoldProduct() {
        return amountSoldProduct;
    }

    public void setAmountSoldProduct(int amountSoldProduct) {
        this.amountSoldProduct = amountSoldProduct;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public int getNew() {
        return New;
    }

    public void setNew(int aNew) {
        New = aNew;
    }

    public int getBlockProduct() {
        return blockProduct;
    }

    public void setBlockProduct(int blockProduct) {
        this.blockProduct = blockProduct;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }
}
