package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Comment implements Serializable {
    private static final long serialVersionUID = 1L;
    private String cmtID;
    private String full_name;
    private String phone_number;
    private String email;
    private String product_id;
    private int rating;
    private String content;

    public Comment(String cmtID, String full_name, String phone_number, String email, String product_id, int rating, String content) {
        this.cmtID = cmtID;
        this.full_name = full_name;
        this.phone_number = phone_number;
        this.email = email;
        this.product_id = product_id;
        this.rating = rating;
        this.content = content;
    }

    public String getCmtID() {
        return cmtID;
    }

    public void setCmtID(String cmtID) {
        this.cmtID = cmtID;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
