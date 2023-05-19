package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class VendorsService {

    public static VendorsService getInstance() {
        return new VendorsService();
    }

    public List<Vendor> getVendors (){
        List<Vendor> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT `vendorID`,`name`,`status` FROM vendors")
                        .mapToBean(Vendor.class)
                        .stream()
                        .collect(Collectors.toList())
        );
       return list;
    }
    public String getVendorsID (){
        List<Vendor> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT `vendorID`,`name`,`status` FROM vendors")
                        .mapToBean(Vendor.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list.get(0).getVendorID();
    }
    public List<VendorStatistic> getVendorsStatistic (){
        List<VendorStatistic> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT v.vendorID, v.`name`, sum(order_details.quantity) as quantity, sum(order_details.price) as price  \n" +
                                "FROM order_details\n" +
                                "INNER JOIN products p on p.productID = order_details.product_id\n" +
                                "INNER JOIN vendors v on p.vendor_id = v.vendorID\n" +
                                "INNER JOIN orders on orders.orderID = order_details.order_id\n" +
                                "Where YEAR(order_date) <= YEAR(now()) and YEAR(order_date) > (YEAR(NOW())-1)\n" +
                                "GROUP BY v.vendorID, v.`name`")
                        .mapToBean(VendorStatistic.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }
    public static void main(String[] args) {
    }


}

