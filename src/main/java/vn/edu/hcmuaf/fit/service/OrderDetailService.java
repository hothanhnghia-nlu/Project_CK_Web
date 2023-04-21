package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.OrderDetail;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class OrderDetailService {

    public static OrderDetailService getInstance() {
        return new OrderDetailService();
    }

    public List<OrderDetail> getAllOrderDetail() {
        List<OrderDetail> orders = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT order_id, product_id, `name`,order_details.quantity, order_details.price , order_details.total FROM order_details INNER JOIN products ON products.productID = order_details.product_id")
                        .mapToBean(OrderDetail.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return orders;
    }
    public List<OrderDetail> getOrderDetailByID(int id) {
        List<OrderDetail> orders = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT order_id, product_id, `name`,order_details.quantity, order_details.price , order_details.total FROM order_details INNER JOIN products ON products.productID = order_details.product_id WHERE order_id = ?")
                        .bind(0,id)
                        .mapToBean(OrderDetail.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return orders;
    }

    public void deleteOrderDetail(int orderId) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM order_details WHERE order_id = ?")
                        .bind(0, orderId)
                        .execute()
        );
    }

    public static void main(String[] args) {
        System.out.println(getInstance().getAllOrderDetail());
    }
}
