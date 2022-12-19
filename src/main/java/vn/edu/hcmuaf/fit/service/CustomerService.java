package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Customer;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class CustomerService {

    public static CustomerService getInstance() {
        return new CustomerService();
    }

    public void insertCustomer(String id, String fullName, String email, String phone, int accID) {
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
}
