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
                handle.createQuery("SELECT order_id, product_id, `name`,order_detail.quantity, order_detail.price , order_detail.total FROM order_detail INNER JOIN product oN product.productID = order_detail.product_id")
                        .mapToBean(OrderDetail.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return orders;
    }
    public List<OrderDetail> getOrderDetailByID(String id) {
        List<OrderDetail> orders = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT order_id, product_id, `name`,order_detail.quantity, order_detail.price , order_detail.total FROM order_detail INNER JOIN product oN product.productID = order_detail.product_id WHERE order_id = ?")
                        .bind(0,id)
                        .mapToBean(OrderDetail.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return orders;
    }
    public static void main(String[] args) {
        System.out.println(getInstance().getAllOrderDetail());
    }
}
