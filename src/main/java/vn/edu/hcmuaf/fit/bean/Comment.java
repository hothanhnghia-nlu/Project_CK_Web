package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Comment implements Serializable {
    private static final long serialVersionUID = 1L;
    private int cmtID;
    private String full_name;
    private String email;
    private String product_name;
    private String content;
    private int rating;
    private String createDate;

    public Comment() {
    }

    public Comment(int cmtID, String full_name, String email, String product_name, String content, int rating, String createDate) {
        this.cmtID = cmtID;
        this.full_name = full_name;
        this.email = email;
        this.product_name = product_name;
        this.content = content;
        this.rating = rating;
        this.createDate = createDate;
    }

    public int getCmtID() {
        return cmtID;
    }

    public void setCmtID(int cmtID) {
        this.cmtID = cmtID;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
}
