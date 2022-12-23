package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Account;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;
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

    public static boolean sendMail(String to, String subject, String text) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("shopphoneltw@gmail.com", "abcdabcd");
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress("shopphoneltw@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(text);
            Transport.send(message);
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}
