package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Brand;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.stream.Collectors;

public class ProductService {

    public static ProductService getInstance() {
        return new ProductService();
    }

    public List<Product> listAllProduct (){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,`vendor_id`, products.`status`, `deleteAt`  " +
                            "FROM products INNER JOIN vendors on products.vendor_id = vendors.vendorID  " +
                            "WHERE products.`status`=0 and vendors.`status`=0")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
       return ImagesService.getInstance().getImgForProducts(pro);
    }
    public List<Product> getTopNewProduct (int n){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,`vendor_id`, products.`status`, `deleteAt` FROM products\n" +
                            "    order by productID DESC\n" +
                            "    LIMIT ?;")
                    .bind(0, n)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return  ImagesService.getInstance().getImgForProducts(pro);
    }
    public List<Product> getTopProduct (int n){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,`vendor_id`, products.`status`, `deleteAt`FROM products order by price DESC LIMIT ?")
                    .bind(0, n)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return  ImagesService.getInstance().getImgForProducts(pro);
    }  public List<Product> getTopSeller (int n){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,`vendor_id`, products.`status`, `deleteAt` FROM products order by discount DESC LIMIT ?")
                    .bind(0, n)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return  ImagesService.getInstance().getImgForProducts(pro);
    }

    public Product getProductByID (String id){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,`vendor_id`, products.`status`, `deleteAt` FROM products WHERE productID= ?")
                    .bind(0, id)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
        return reDiscription(ImagesService.getInstance().getImgForProducts(pro).get(0));
    }
    public List<Product> getProductByCAT_ID (String id){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,`vendor_id`, products.`status`, `deleteAt` FROM products WHERE cat_id= ?")
                    .bind(0, id)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
        return pro;
    }
    public List<Product> getProductByName (String name){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,`vendor_id`, products.`status`, `deleteAt` FROM products WHERE name like ?")
                    .bind(0, "%"+name+"%")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return pro;
    }
    //admin
    public void deleteProduct(String Id) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM products WHERE productID = ?")
                        .bind(0, Id)
                        .execute()
        );
    }

    public void setProduct (String productID, String cat_id, String name, String brand, String image, String discription,  int quantity,int price, int discount){
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE products SET cat_id=?  ,`name` = ? , brand = ?, image= ?, discription=?, quantity=?,price=?,discount=?  WHERE productID = ?")
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
                handle.createUpdate("INSERT INTO products values (?,?,?,?,?,?,?,?,?)")
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
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,`vendor_id`, products.`status`, `deleteAt` FROM  products WHERE productID = ?")
                    .bind(0,id)
                    .mapToBean(Product.class).findFirst().orElse(null);
        });
    }
    public Product reDiscription(Product p){

        StringTokenizer st = new StringTokenizer ( p. getDescription(),"\t" ) ;
        String resut= "";
        boolean check= true;
        while ( st. hasMoreTokens ()) {

            if(check) {
                resut=resut+"<tr> \n";
                resut= resut +"<td>" + st.nextToken() + "</td> \n";
                check = false;
            }else {
                resut=resut +"<td>" + st.nextToken() + "</td> \n"
                        + "</tr> \n";
                check = true;
            }
        }
        p.setDescription(resut);
        return p;
    }

    public static void main(String[] args) {
        ProductService a = new ProductService();
        ImagesService i = new ImagesService();
        System.out.println(a.listAllProduct());

    }


}

