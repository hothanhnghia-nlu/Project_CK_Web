package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Feedback implements Serializable {
    private static final long serialVersionUID = 1L;
    private String feedbackID;
    private String full_name;
    private String phone_number;
    private String email;
    private String subject_name;
    private String content;
    public Feedback() {

    }

    public Feedback(String feedbackID, String full_name, String phone_number, String email, String subject_name, String content) {
        this.feedbackID = feedbackID;
        this.full_name = full_name;
        this.phone_number = phone_number;
        this.email = email;
        this.subject_name = subject_name;
        this.content = content;
    }

    public String getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(String feedbackID) {
        this.feedbackID = feedbackID;
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

    @Override
    public String toString() {
        return "Feedback{" +
                "feedbackID='" + feedbackID + '\'' +
                ", full_name='" + full_name + '\'' +
                ", phone_number='" + phone_number + '\'' +
                ", email='" + email + '\'' +
                ", subject_name='" + subject_name + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
