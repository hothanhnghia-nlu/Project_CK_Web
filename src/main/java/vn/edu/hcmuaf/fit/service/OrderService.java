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
                handle.createQuery("SELECT * FROM orders AS OD INNER JOIN customer AS CUS ON CUS.id = OD.customer_id")
                        .mapToBean(Order.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return orders;
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

    public void deleteOrder(String orderId) {
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

    public static void main(String[] args) {
//        System.out.println(getInstance().getAllOrderDetail());
    }
}
