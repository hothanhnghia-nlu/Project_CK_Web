package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Image implements Serializable {
    private static final long serialVersionUID = 1L;
    private String imageID;
    private String product_id;
    private String name;
    private String url;
    private String status;

    public Image(String imageID, String product_id, String name, String url, String status) {
        this.imageID = imageID;
        this.product_id = product_id;
        this.name = name;
        this.url = url;
        this.status = status;
    }

    public Image() {
    }

    public String getImageID() {
        return imageID;
    }

    public void setImageID(String imageID) {
        this.imageID = imageID;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "images{" +
                "imageID='" + imageID + '\'' +
                ", product_id='" + product_id + '\'' +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
