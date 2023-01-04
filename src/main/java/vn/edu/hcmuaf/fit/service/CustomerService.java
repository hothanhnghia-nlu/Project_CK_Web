package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Customer;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class CustomerService {

    public static CustomerService getInstance() {
        return new CustomerService();
    }

    // Add a new customer
    public void insert(String id, String fullName, String email, String phone, int accID) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO customer (?, ?, ?, ?, ?)")
                        .bind(0, id)
                        .bind(1, fullName)
                        .bind(2, email)
                        .bind(3, phone)
                        .bind(4, accID)
                        .execute()
        );
    }

    // Update customer
    public void update(Customer customer) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE customer SET id = ?, fullname = ?, email = ?, phone_number = ?")
                        .bind(0, customer)
                        .execute()
        );
    }

    // Select customer by id
    public Customer selectById(String id) {
        List<Customer> customers = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM customer WHERE id = ?")
                        .bind(0, id)
                        .mapToBean(Customer.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        Customer c = new Customer();
        for (int i = 0; i < customers.size(); i++) {
            c = customers.get(i);
        }
        return c;
    }

    public String selectCustomerId(String fullName) {
        List<Customer> customers = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT id FROM customer WHERE fullname = ?")
                        .bind(0, fullName)
                        .mapToBean(Customer.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        String res = "";
        for (int i = 0; i < customers.size(); i++) {
            res += customers.get(i).getId();
        }
        return res;
    }

    // Check account exist
    public boolean checkExist(String id) {
        List<Customer> customers = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE id = ?")
                        .bind(0, id)
                        .mapToBean(Customer.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < customers.size(); i++) {
            Customer cus = customers.get(i);
            if (cus.getId().equals(id)) {
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(CustomerService.getInstance().selectById("KH011"));
        System.out.println(CustomerService.getInstance().selectCustomerId("Nguyen Minh Man"));
    }
}
