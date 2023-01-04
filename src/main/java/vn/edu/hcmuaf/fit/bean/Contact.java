package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Contact implements Serializable {
    private static final long serialVersionUID = 1L;
    private String contactId;
    private Customer customer;
    private String subject;
    private String content;

    public Contact() {
    }

    public Contact(String contactId, Customer customer, String subject, String content) {
        this.contactId = contactId;
        this.customer = customer;
        this.subject = subject;
        this.content = content;
    }

    public String getContactId() {
        return contactId;
    }

    public void setContactId(String contactId) {
        this.contactId = contactId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
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
                "contactId='" + contactId + '\'' +
                ", customer=" + customer +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
