package vn.edu.hcmuaf.fit.service;

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
                h.createQuery("SELECT * FROM user WHERE username = ?")
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
        List<User> users = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM user WHERE username = ?")
                        .bind(0, username)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < users.size(); i++) {
            User acc = users.get(i);
            if (acc.getUsername().equals(username)) {
                return true;
            }
        }
        return false;
    }

    // Register a new account
    public void register(String fullName, String email, String phone, String username, String password) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO user (full_name, email, phone_number, username, password) VALUES (?, ?, ?, ?, ?)")
                        .bind(0, fullName)
                        .bind(1, email)
                        .bind(2, phone)
                        .bind(3, username)
                        .bind(4, password)
                        .execute()
        );
    }

    // Update a user
    public void updatePassword(String username, String newPass) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE user SET password = ? WHERE username = ?")
                        .bind(0, username)
                        .bind(1, newPass)
                        .execute()
        );
    }

    // Get username and password by email
    public String getUsernameAndPassword(String email) {
        List<User> accounts = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT username, password FROM user WHERE email = ?")
                        .bind(0, email)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        String res = "";
        for (int i = 0; i < accounts.size(); i++) {
            res += "Username: " +  accounts.get(i).getUsername() + "\nPassword: " + accounts.get(i).getPassword();
        }
        return res;
    }

    public List<User> getAll() {
        List<User> accounts = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM user")
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return accounts;
    }

    // Check email exist
    public boolean checkEmailExist(String email) {
        List<User> accounts = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT email FROM user WHERE email = ?")
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

    public  List<User> listALlUser(){
        List<User> lu = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM user")
                    .mapToBean(User.class)
                    .stream().collect(Collectors.toList());
        });
        return lu;
    }
    //admin
    public void deleteUser(String Id){
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("DELETE FROM user WHERE id = ?")
                    .bind(0,Id)
                    .execute();

        });
    }
    public void updateID (int id, int role){
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE user SET role=?   WHERE id = ?")
                        .bind(1, id)
                        .bind(0, role)
                        .execute()
        );
    }
    public static void main(String[] args) {
//        System.out.println(getInstances().listALlUser());
    }
}
