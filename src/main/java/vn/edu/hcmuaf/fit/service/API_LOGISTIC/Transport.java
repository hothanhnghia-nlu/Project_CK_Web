package vn.edu.hcmuaf.fit.service.API_LOGISTIC;

import vn.edu.hcmuaf.fit.bean.Order;

public class Transport {
    private String id;
    private Order order;
    private String createAt;
    private String leadTime;

    public static String WAITING = "Đang xử lý";

    public Transport() {
    }

    public Transport(String id, Order order, String createAt, String leadTime) {
        this.id = id;
        this.order = order;
        this.createAt = createAt;
        this.leadTime = leadTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getLeadTime() {
        return leadTime;
    }

    public void setLeadTime(String leadTime) {
        this.leadTime = leadTime;
    }
}
