package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Account;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.stream.Collectors;

public class AccountService {
    private static AccountService instance;

    private AccountService() {
    }

    public static AccountService getInstance() {
        if (instance == null) {
            instance = new AccountService();
        }
        return instance;
    }

    public Account checkLogin(String username, String password) {
        List<Account> accounts = JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from account where username = ?")
                        .bind(0, username)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (accounts.size() != 1) {
            return null;
        }
        Account acc = accounts.get(0);
        if (!acc.getPassword().equals(hashPassword(password)) || !acc.getUsername().equals(username)) {
            return null;
        }
        return acc;
    }

    public String hashPassword(String password) {
        try {
            MessageDigest sha256 = null;
            sha256 = MessageDigest.getInstance("SHA-256");
            byte[] hash = sha256.digest(password.getBytes());
            BigInteger number = new BigInteger(1, hash);
            return number.toString(16);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }
}
