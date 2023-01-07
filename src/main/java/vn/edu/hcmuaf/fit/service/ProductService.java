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
    //admin
    public void deleteProduct(String Id) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM product WHERE productID = ?")
                        .bind(0, Id)
                        .execute()
        );
    }

    public void setProduct (String productID, String cat_id, String name, String brand, String image, String discription,  int quantity,int price, int discount){
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE product SET cat_id=?  ,`name` = ? , brand = ?, image= ?, discription=?, quantity=?,price=?,discount=?  WHERE productID = ?")
                        .bind(8, productID)
                        .bind(0, cat_id)
                        .bind(1, name)
                        .bind(2, brand)
                        .bind(3, image)
                        .bind(4, discription)
                        .bind(5, quantity)
                        .bind(6, price)
                        .bind(7, discount)
                        .execute()
        );
    }
    public void addProduct (String productID, String cat_id, String name, String brand, String image, String discription,  int quantity,int price, int discount){
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO product values (?,?,?,?,?,?,?,?,?)")
                        .bind(0, productID)
                        .bind(1, cat_id)
                        .bind(2, name)
                        .bind(3, brand)
                        .bind(4, image)
                        .bind(5, discription)
                        .bind(6, quantity)
                        .bind(7, price)
                        .bind(8, discount)
                        .execute()

        );
    }
    public Product get(String id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM  product WHERE productID = ?")
                    .bind(0,id)
                    .mapToBean(Product.class).findFirst().orElse(null);
        });
    }
    public static void main(String[] args) {
        ProductService a = new ProductService();
//        a.setProduct("088","VP012","Dell Inspiron 16 5625","Dell","./img/product/vanphong/Dell%20Inspiron%2016%205620.jpg","CPU	 AMD Ryzen™ 5 5625U 6-core/12-thread",100,22890000, 19890000);
        System.out.println(a.get("001"));
    }


}

