package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Account;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class AccountService {

    public static AccountService getInstances() {
        return new AccountService();
    }

    // Check login is right
    public Account checkLogin(String username, String password) {
        List<Account> accounts = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE username = ?")
                        .bind(0, username)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (accounts.size() != 1) return null;
        Account acc = accounts.get(0);
        if (!acc.getPassword().equals(password)
                || !acc.getUsername().equals(username)) return null;
        return acc;
    }

    // Check account exist
    public boolean checkAccountExist(String username) {
        List<Account> accounts = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE username = ?")
                        .bind(0, username)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < accounts.size(); i++) {
            Account acc = accounts.get(i);
            if (acc.getUsername().equals(username)) {
                return true;
            }
        }
        return false;
    }

    // Register a new account
    public void register(String username, String password, String email) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO account (username, password, email) VALUES (?, ?, ?)")
                        .bind(0, username)
                        .bind(1, password)
                        .bind(2, email)
                        .execute()
        );
    }

    // Get username and password by email
    public String getUsernameAndPassword(String email) {
        List<Account> accounts = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE email = ?")
                        .bind(0, email)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        String res = "";
        for (int i = 0; i < accounts.size(); i++) {
            res += "Username: " +  accounts.get(i).getUsername() + "\nPassword: " + accounts.get(i).getPassword();
        }
        return res;
    }

    // Check email exist
    public boolean checkEmailExist(String email) {
        List<Account> accounts = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT email FROM account WHERE email = ?")
                        .bind(0, email)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < accounts.size(); i++) {
            Account acc = accounts.get(i);
            if (acc.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }
}
