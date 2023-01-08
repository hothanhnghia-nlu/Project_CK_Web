package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class OrderService {

    public static OrderService getInstance() {
        return new OrderService();
    }

    public List<Order> getAllOrder() {
        List<Order> orders = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders")
                        .mapToBean(Order.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return orders;
    }
    public int getNewID() {
        List<Order> orders = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders order by orderID DESC Limit 1")
                        .mapToBean(Order.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        int newID = 0;
        Order order = new Order();
        for (int i = 0; i < orders.size(); i++) {
            order = orders.get(i);
            newID = Integer.parseInt(order.getOrderId());
        }
        return newID;
    }

    public void deleteOrder(int orderId) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM orders WHERE orderID = ?")
                        .bind(0, orderId)
                        .execute()
        );
    }

    public void deleteAll() {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM orders")
                        .execute()
        );
    }

    public void addOrder(String id,String fullName, String phone, String email, String address, String note) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO orders (orderID, full_name, phone_number, email, address, note, order_date)  VALUES (?,?, ?, ?, ?, ?, NOW())")
                        .bind(0, id)
                        .bind(1, fullName)
                        .bind(2, phone)
                        .bind(3, email)
                        .bind(4, address)
                        .bind(5, note)
                        .execute()
        );
    }
    public void addOrderDetails(String id,String productID, int quantity, double price) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO order_detail (order_id, product_id, quantity, price, total)  VALUES (?,?, ?, ?, ?)")
                        .bind(0, id)
                        .bind(1, productID)
                        .bind(2, quantity)
                        .bind(3, price)
                        .bind(4, quantity * price)
                        .execute()
        );
    }
}
