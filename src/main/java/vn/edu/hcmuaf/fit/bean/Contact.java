package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Contact implements Serializable {
    private static final long serialVersionUID = 1L;
    private String feedbackID ;
    private User customer;
    private String subject;
    private String content;

    public Contact() {
    }

    public Contact(String feedbackID, User customer, String subject, String content) {
        this.feedbackID = feedbackID;
        this.customer = customer;
        this.subject = subject;
        this.content = content;
    }

    public String getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(String feedbackID) {
        this.feedbackID = feedbackID;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "contactId='" + feedbackID + '\'' +
                ", customer=" + customer +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
