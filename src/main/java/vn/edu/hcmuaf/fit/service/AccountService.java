package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Account;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class AccountService {

    public static AccountService getInstance() {
        return new AccountService();
    }

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

    public boolean checkAccountExist(String username, String email) {
        List<Account> accounts = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE username = ? AND email = ?")
                        .bind(0, username)
                        .bind(1, email)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < accounts.size(); i++) {
            Account acc = accounts.get(i);
            if (acc.getUsername().equals(username) && acc.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }

    public void register(String username, String password, String email) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO account (username, password, email) VALUES (?, ?, ?)")
                        .bind(0, username)
                        .bind(1, password)
                        .bind(2, email)
                        .execute()
        );
    }
}
