package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Brand;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductService {

    public static ProductService getInstance() {
        return new ProductService();
    }

    public List<Product> listAllProduct (){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
       return pro;
    }
    public List<Brand> getAllbrand (){
        List<Brand> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT DISTINCT product.brand FROM product")
                    .mapToBean(Brand.class)
                    .stream().collect(Collectors.toList());
        });
        return pro;
    }
    public List<Product> getTopNewProduct (int n){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product\n" +
                            "    order by productID DESC\n" +
                            "    LIMIT ?;")
                    .bind(0, n)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return pro;
    }
    public List<Product> getTopProduct (int n){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product order by price DESC LIMIT ?")
                    .bind(0, n)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return pro;
    }  public List<Product> getTopSeller (int n){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product order by discount DESC LIMIT ?")
                    .bind(0, n)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return pro;
    }

    public Product getProductByID (String id){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product WHERE productID= ?")
                    .bind(0, id)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
        return pro.get(0);
    }
    public List<Product> getProductByCAT_ID (String id){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product WHERE cat_id= ?")
                    .bind(0, id)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
        return pro;
    }
    public List<Product> getProductByName (String name){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product WHERE name like ?")
                    .bind(0, "%"+name+"%")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return pro;
    }
    public static void main(String[] args) {
        ProductService a = new ProductService();
        System.out.println(a.getProductByName("dell"));
    }
}

