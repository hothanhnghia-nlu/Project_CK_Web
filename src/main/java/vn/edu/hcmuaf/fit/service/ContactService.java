package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Contact;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class ContactService {

    public static ContactService getInstances() {
        return new ContactService();
    }

    // Add a new contact
    public void insert(String fullName, String phone, String email, String subject, String content) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO feedback (full_name, phone_number, email, subject_name, content) VALUES (?, ?, ?, ?, ?)")
                        .bind(0, fullName)
                        .bind(1, phone)
                        .bind(2, email)
                        .bind(3, subject)
                        .bind(4, content)
                        .execute()
        );
    }

    // Delete contact
    public void delete(String id) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM feedback WHERE feedbackID = ?")
                        .bind(0, id)
                        .execute()
        );
    }

    // Select all contact
    public List<Contact> selectAll() {
        List<Contact> contacts = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM feedback")
                        .mapToBean(Contact.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return contacts;
    }
}
