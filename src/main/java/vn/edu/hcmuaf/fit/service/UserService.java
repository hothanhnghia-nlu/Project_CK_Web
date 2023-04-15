package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Contact;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.security.MessageDigest;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

public class UserService {

    public static UserService getInstances() {
        return new UserService();
    }

    // Check login is right
    public User checkLogin(String username, String password) {
        List<User> accounts = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM users WHERE username = ?")
                        .bind(0, username)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (accounts.size() != 1) return null;
        User acc = accounts.get(0);
        if (!acc.getPassword().equals(password)
                || !acc.getUsername().equals(username)) return null;
        return acc;
    }

    // Check account exist
    public boolean checkAccountExist(String username) {
        List<User> user = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM users WHERE username = ?")
                        .bind(0, username)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < user.size(); i++) {
            User acc = user.get(i);
            if (acc.getUsername().equals(username)) {
                return true;
            }
        }
        return false;
    }
    // Register a new account
    public void register(String id, String fullName, String email, String phone, String username, String password) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO users (id, full_name, email, phone_number, username, password) VALUES (?, ?, ?, ?, ?, ?)")
                        .bind(0, id)
                        .bind(1, fullName)
                        .bind(2, email)
                        .bind(3, phone)
                        .bind(4, username)
                        .bind(5, password)
                        .execute()
        );
    }

    // Update a new password
    public void updatePassword(String email, String newPassword) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE users SET password = ? WHERE email = ?")
                        .bind(0, newPassword)
                        .bind(1, email)
                        .execute()
        );
    }

    // Update user information
    public void updateUserInfo(String email, String address, String birthday) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE users SET address = ?, birthday = ? WHERE email = ?")
                        .bind(0, address)
                        .bind(1, birthday)
                        .bind(2, email)
                        .execute()
        );
    }

    // Get new id
    public int getNewID() {
        List<User> users = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM users order by id DESC Limit 1")
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < users.size(); i++) {
            return users.get(i).getId();
        }
        return 0;
    }

    // Get user email
        public String getUserEmail() {
        List<User> users = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT email FROM users ")
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < users.size(); i++) {
            return users.get(i).getEmail();
        }
        return null;
    }

    // Check email exist
    public boolean checkEmailExist(String email) {
        List<User> accounts = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT email FROM users WHERE email = ?")
                        .bind(0, email)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < accounts.size(); i++) {
            User acc = accounts.get(i);
            if (acc.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }

    // Encrypt password
    public String hashPassword(String password) {
        String salt = "aspkmhtvtu#pgjliu7zlqfcy";
        String result = null;
        password += salt;

        try {
            byte[] dataBytes = password.getBytes("UTF-8");
            MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
            result = Base64.getEncoder().encodeToString(sha256.digest(dataBytes));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // Get all user
    public  List<User> listALlUser(){
        List<User> lu = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM users")
                    .mapToBean(User.class)
                    .stream().collect(Collectors.toList());
        });
        return lu;
    }

    //admin
    public void deleteUser(String Id){
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("DELETE FROM users WHERE id = ?")
                    .bind(0,Id)
                    .execute();

        });
    }
    public void updateID (int id, int role){
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE users SET role = ? WHERE id = ?")
                        .bind(1, id)
                        .bind(0, role)
                        .execute()
        );
    }
}
