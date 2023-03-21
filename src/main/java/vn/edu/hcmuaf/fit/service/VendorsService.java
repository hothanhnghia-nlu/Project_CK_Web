package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Image;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.bean.Vendor;
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


    public static void main(String[] args) {
    }


}

