package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Order;
//import vn.edu.hcmuaf.fit.bean.OrderDetail;
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
        return Integer.parseInt(orders.get(0).getOrderId());
    }

//    public List<OrderDetail> getAllOrderDetail() {
//        List<OrderDetail> orderDetails = JDBIConnector.get().withHandle(handle ->
//                handle.createQuery("SELECT * FROM order_detail AS ODD INNER JOIN product AS PD ON PD.productID = ODD.product_id")
//                        .mapToBean(OrderDetail.class)
//                        .stream()
//                        .collect(Collectors.toList())
//        );
//        return orderDetails;
//    }

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
                handle.createUpdate("INSERT INTO orders  VALUES (?,?, ?, ?, ?, ?, NOW(),?)")
                        .bind(0, id)
                        .bind(1, fullName)
                        .bind(2, phone)
                        .bind(3, email)
                        .bind(4, address)
                        .bind(5, note)
                        .bind(6, note)
                        .execute()
        );
    }
    public void addOrderDetails(String id,String productID, int quantity, int price) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO order_detail  VALUES (?,?, ?, ?, ?)")
                        .bind(0, id)
                        .bind(1, productID)
                        .bind(2, quantity)
                        .bind(3, price)
                        .bind(4, quantity*price)

                        .execute()
        );
    }

    public static void main(String[] args) {
        getInstance().addOrderDetails("1","007",600,2);
    }
}
