package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Contact implements Serializable {
    private static final long serialVersionUID = 1L;
    private int contactID;
    private String fullName;
    private String phone_number;
    private String email;
    private String subject_name;
    private String content;
    private String createDate;

    public Contact() {
    }

    public Contact(int contactID, String fullName, String phone_number, String email, String subject_name, String content, String createDate) {
        this.contactID = contactID;
        this.fullName = fullName;
        this.phone_number = phone_number;
        this.email = email;
        this.subject_name = subject_name;
        this.content = content;
        this.createDate = createDate;
    }

    public int getContactID() {
        return contactID;
    }

    public void setContactID(int contactID) {
        this.contactID = contactID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
}
