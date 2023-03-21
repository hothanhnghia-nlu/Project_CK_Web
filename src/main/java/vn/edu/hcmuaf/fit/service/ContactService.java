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
    public void insert(String id, String fullName, String phone, String email, String subject, String content) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO contacts VALUES (?, ?, ?, ?, ?, ?, NOW())")
                        .bind(0, id)
                        .bind(1, fullName)
                        .bind(2, phone)
                        .bind(3, email)
                        .bind(4, subject)
                        .bind(5, content)
                        .execute()
        );
    }

    // Get a new id
    public int getNewID() {
        List<Contact> contacts = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM contacts order by contactID DESC Limit 1")
                        .mapToBean(Contact.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < contacts.size(); i++) {
            return Integer.parseInt(contacts.get(i).getFeedbackID());
        }
        return 0;
    }

    // Delete contact
    public void delete(String id) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM contacts WHERE contactID = ?")
                        .bind(0, id)
                        .execute()
        );
    }

    // Select all contact
    public List<Contact> selectAll() {
        List<Contact> contacts = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM contacts")
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
