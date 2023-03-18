package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    private String productID;
    private String cat_id;
    private String name;

    private List<String> image;
    private String description;
    private String vendor_id;
    private int status;
    private Date deleteAt;

    public Product() {
    }

    public Product(String productID, String cat_id, String name, String description, String vendor_id, int status, Date deleteAt) {
        this.productID = productID;
        this.cat_id = cat_id;
        this.name = name;
        this.description = description;
        this.vendor_id = vendor_id;
        this.status = status;
        this.deleteAt = deleteAt;
    }

    public Product(String productID, String cat_id, String name, List<String> image, String description, String vendor_id, int status, Date deleteAt) {
        this.productID = productID;
        this.cat_id = cat_id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.vendor_id = vendor_id;
        this.status = status;
        this.deleteAt = deleteAt;
    }

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

    public List<String> getImage() {
        return image;
    }

    public void setImage(List<String> image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getVendor_id() {
        return vendor_id;
    }

    public void setVendor_id(String vendor_id) {
        this.vendor_id = vendor_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getDeleteAt() {
        return deleteAt;
    }

    public void setDeleteAt(Date deleteAt) {
        this.deleteAt = deleteAt;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productID='" + productID + '\'' +
                ", cat_id='" + cat_id + '\'' +
                ", name='" + name + '\'' +
                ", image=" + image +
                ", discription='" + description + '\'' +
                ", vendor_id='" + vendor_id + '\'' +
                ", status=" + status +
                ", deleteAt=" + deleteAt +
                '}';
    }


}
