package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Contact;
import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class ContactService {

    public static ContactService getInstances() {
        return new ContactService();
    }

    // Add a new contact
    public void insert(String id,String fullName, String phone, String email, String subject, String content) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO feedback VALUES (?,?, ?, ?, ?, ?)")
                        .bind(0, id)
                        .bind(1, fullName)
                        .bind(2, phone)
                        .bind(3, email)
                        .bind(4, subject)
                        .bind(5, content)
                        .execute()
        );
    }
    public int getNewID() {
        List<Contact> contacts = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM feedback order by feedbackID DESC Limit 1")
                        .mapToBean(Contact.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return Integer.parseInt(contacts.get(0).getFeedbackID());
    }
    // Delete contactSSS
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

    public static void main(String[] args) {
        String id = ""+ContactService.getInstances().getNewID();
        System.out.println(id);
//        ContactService.getInstances().insert("2","aaa","012021","fasdghaf@gmail.com","hfhhf","abcdef");
//        ContactService.getInstances().insert(id,"s","555","sss@gmail.com","sds","ádasd");
    }
}
