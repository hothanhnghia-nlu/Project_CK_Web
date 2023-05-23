package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.service.API_LOGISTIC.Transport;

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
    public List<Order> getOrderByEmail(String email) {
        List<Order> orders = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT o.orderID, o.full_name, o.email, o.payment FROM orders o, users u WHERE o.email = u.email AND u.email = ?")
                        .bind(0, email)
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
            newID = order.getOrderId();
        }
        return newID;
    }

    public int getOrderId(String email) {
        List<Order> orders = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT o.orderID FROM orders o, users u WHERE o.email = u.email AND u.email = ?")
                        .bind(0, email)
                        .mapToBean(Order.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        int newID = 0;
        Order order = new Order();
        for (int i = 0; i < orders.size(); i++) {
            order = orders.get(i);
            newID = order.getOrderId();
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

    public void addOrder(int id,String fullName, String phone, String email, String address, String note, String payment) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO orders (orderID, full_name, phone_number, email, address, note, order_date, payment)  VALUES (?,?, ?, ?, ?, ?, NOW(), ?)")
                        .bind(0, id)
                        .bind(1, fullName)
                        .bind(2, phone)
                        .bind(3, email)
                        .bind(4, address)
                        .bind(5, note)
                        .bind(6, payment)
                        .execute()
        );
    }
    public void addOrderDetails(int id, String productID, int quantity, double price) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO order_details (order_id, product_id, quantity, price, total)  VALUES (?,?, ?, ?, ?)")
                        .bind(0, id)
                        .bind(1, productID)
                        .bind(2, quantity)
                        .bind(3, price)
                        .bind(4, quantity * price)
                        .execute()
        );
    }

    public void updateStatus(int id, int status) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE orders SET status = ? WHERE orderID = ?")
                        .bind(0, status)
                        .bind(1, id)
                        .execute()
        );
    }

    public List<Order> getTop5Order(){
        List<Order> oder = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders ORDER BY orders.order_date DESC LIMIT 5")
                        .mapToBean(Order.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return oder;
    }

    public void addTransport(Transport transport) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO transports (transID, order_id, created_at, lead_time) VALUES (?, ?, ?, ?)")
                        .bind(0, transport.getId())
                        .bind(1, transport.getOrder().getOrderId())
                        .bind(2, transport.getCreateAt())
                        .bind(3, transport.getLeadTime())
                        .execute()
        );
    }

    public String getNewTransID() {
        List<Transport> transports = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders order by orderID DESC Limit 1")
                        .mapToBean(Transport.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        String newID = "";
        Transport transport = new Transport();
        for (int i = 0; i < transports.size(); i++) {
            transport = transports.get(i);
            newID = transport.getId();
        }
        return newID;
    }

    public int getNumTrans(int id) {
        List<Transport> transports = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM transports WHERE order_id =\" + id")
                        .bind(0, id)
                        .mapToBean(Transport.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        int num = 0;
        Transport transport = new Transport();
        for (int i = 0; i < transports.size(); i++) {
            transport = transports.get(i);
            num = transport.getOrder().getOrderId();
        }
        return num;
    }

    public Transport getTransportId(int id) {
        List<Transport> transports = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT transID, order_id, created_at, lead_time FROM transports WHERE order_id =\" + i")
                        .mapToBean(Transport.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        Transport transport = new Transport();
        Order order = new Order();
        for (int i = 0; i < transports.size(); i++) {
            order.setOrderId(id);
            transport = transports.get(i);
        }
        return transport;
    }

    public void updateOrderStatusByTransportLeadTime() {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE orders SET status = 2 WHERE orderID IN " +
                                "(SELECT order_id FROM transports WHERE DATEDIFF(NOW(), STR_TO_DATE(lead_time, '%d/%m/%Y')) >= 0) AND status != 2")
                        .execute()
        );
    }
}
