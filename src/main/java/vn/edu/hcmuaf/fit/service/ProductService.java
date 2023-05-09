package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Brand;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.io.File;
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
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,out_price,vendors.`name` as vendor, products.`status`, `deleteAt`, sum(prices.quanity) as quantity\n" +
                            "FROM products INNER JOIN vendors on products.vendor_id = vendors.vendorID INNER JOIN prices on prices.product_id= products.productID\n" +
                            "WHERE products.`status`=0 and vendors.`status`=0 and  products.deleteAt  IS NULL \n" +
                            "GROUP BY  productID, cat_id,products.`name`, `description`,out_price,`vendor_id`, products.`status`, `deleteAt`")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
       return ImagesService.getInstance().getImgForProducts(pro);
    }
    public List<Product> getTopNewProduct (int n){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,out_price,vendors.`name` as`vendor`, products.`status`, `deleteAt`, sum(prices.quanity) as quantity\n" +
                            "FROM products INNER JOIN vendors on products.vendor_id = vendors.vendorID INNER JOIN prices on prices.product_id= products.productID\n" +
                            "WHERE products.`status`=0 and vendors.`status`=0 \n" +
                            "GROUP BY  productID, cat_id,products.`name`, `description`,out_price,`vendor_id`, products.`status`, `deleteAt`\n" +
                            "order by productID DESC\n" +
                            "LIMIT ?;")
                    .bind(0, n)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return  ImagesService.getInstance().getImgForProducts(pro);
    }
    public List<Product> listDeleteProduct (){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,out_price,vendors.`name` as vendor, products.`status`, `deleteAt`, sum(prices.quanity) as quantity\n" +
                            "FROM products INNER JOIN vendors on products.vendor_id = vendors.vendorID INNER JOIN prices on prices.product_id= products.productID\n" +
                            "WHERE products.`status`=0 and vendors.`status`=0 and products.deleteAt!=0 \n" +
                            "GROUP BY  productID, cat_id,products.`name`, `description`,out_price,`vendor_id`, products.`status`, `deleteAt`")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return ImagesService.getInstance().getImgForProducts(pro);
    }

    public List<Product> getTopProduct (int n){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,out_price,vendors.`name` as`vendor`, products.`status`, `deleteAt`, sum(prices.quanity) as quantity\n" +
                            "FROM products INNER JOIN vendors on products.vendor_id = vendors.vendorID INNER JOIN prices on prices.product_id= products.productID\n" +
                            "WHERE products.`status`=0 and vendors.`status`=0  \n" +
                            "GROUP BY  productID, cat_id,products.`name`, `description`,out_price,`vendor_id`, products.`status`, `deleteAt`\n" +
                            "order by out_price DESC LIMIT ?\n")
                    .bind(0, n)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return  ImagesService.getInstance().getImgForProducts(pro);
    }
    public List<Product> getTopSeller (int n){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,out_price,vendors.`name` as`vendor`, products.`status`, `deleteAt`, sum(prices.quanity) as quantity\n" +
                            "FROM products INNER JOIN vendors on products.vendor_id = vendors.vendorID INNER JOIN prices on prices.product_id= products.productID\n" +
                            "WHERE products.`status`=0 and vendors.`status`=0  and prices.quanity !=0\n" +
                            "GROUP BY  productID, cat_id,products.`name`, `description`,out_price,`vendor_id`, products.`status`, `deleteAt`\n" +
                            "order by quantity ASC LIMIT ?")
                    .bind(0, n)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return  ImagesService.getInstance().getImgForProducts(pro);
    }
    public List<Product> getTopSellerAsVendorID (int n, String id){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,out_price,vendors.`name` as`vendor`, products.`status`, `deleteAt`, sum(prices.quanity) as quantity \n" +
                            "FROM products INNER JOIN vendors on products.vendor_id = vendors.vendorID INNER JOIN prices on prices.product_id= products.productID \n" +
                            "WHERE products.`status`=0 and vendors.`status`=0  and prices.quanity !=0 and vendors.`name`= ? \n" +
                            "GROUP BY  productID, cat_id,products.`name`, `description`,out_price,`vendor_id`, products.`status`, `deleteAt`\n" +
                            "order by quantity ASC LIMIT ?")
                    .bind(0, id).bind(1, n)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return  ImagesService.getInstance().getImgForProducts(pro);
    }

    public Product getProductByID (String id){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,out_price,vendors.`name` as vendor, products.`status`, `deleteAt`, sum(prices.quanity) as quantity\n" +
                            "FROM products INNER JOIN vendors on products.vendor_id = vendors.vendorID INNER JOIN prices on prices.product_id= products.productID\n" +
                            "WHERE products.`status`=0 and productID= ?\n" +
                            "GROUP BY  productID, cat_id,products.`name`, `description`,out_price,`vendor_id`, products.`status`, `deleteAt`")
                    .bind(0, id)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
        return reDiscription(ImagesService.getInstance().getImgForProducts(pro).get(0));
    }
    public List<Product> getProductByCAT_ID (String id){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,out_price,vendors.`name` as`vendor`, products.`status`, `deleteAt`, sum(prices.quanity) as quantity\n" +
                            "FROM products INNER JOIN vendors on products.vendor_id = vendors.vendorID INNER JOIN prices on prices.product_id= products.productID\n" +
                            "WHERE products.`status`=0 and vendors.`status`=0  \n" +
                            "and cat_id= ? \n" +
                            "GROUP BY  productID, cat_id,products.`name`, `description`,out_price,`vendor_id`, products.`status`, `deleteAt`\n")
                    .bind(0, id)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
        return ImagesService.getInstance().getImgForProducts(pro);
    }
    public List<Product> getProductByCat_Id_And_Vendor (String idCat, String idVendor){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,out_price,vendors.`name` as`vendor`, products.`status`, `deleteAt`, sum(prices.quanity) as quantity\n" +
                            "FROM products INNER JOIN vendors on products.vendor_id = vendors.vendorID INNER JOIN prices on prices.product_id= products.productID\n" +
                            "WHERE products.`status`=0 and vendors.`status`=0  and products.cat_id = ? and products.vendor_id = ?\n" +
                            "GROUP BY  productID, cat_id,products.`name`, `description`,out_price,`vendor_id`, products.`status`, `deleteAt`")
                    .bind(0, idCat).bind(1, idVendor)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
        return ImagesService.getInstance().getImgForProducts(pro);
    }
    public List<Product> getProductByName (String name){
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT productID, cat_id,products.`name`, `description`,out_price,vendors.`name` as`vendor`, products.`status`, `deleteAt`, sum(prices.quanity) as quantity\n" +
                            "FROM products INNER JOIN vendors on products.vendor_id = vendors.vendorID INNER JOIN prices on prices.product_id= products.productID\n" +
                            "WHERE products.`status`=0 and vendors.`status`=0  \n" +
                            "and products.`name` like ? \n" +
                            "GROUP BY  productID, cat_id,products.`name`, `description`,out_price,`vendor_id`, products.`status`, `deleteAt`")
                    .bind(0, "%"+name+"%")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        return ImagesService.getInstance().getImgForProducts(pro);
    }
    //admin
    public void deleteProduct(String Id) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM products WHERE productID = ?")
                        .bind(0, Id)
                        .execute()
        );
    }
    public void deleteSoftProduct(String Id) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE products\n" +
                                "SET deleteAt = NOW()\n" +
                                "WHERE productID = ?")
                        .bind(0, Id)
                        .execute()
        );
    }
    public void deleteUnSoftProduct(String Id) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE products \n" +
                                "SET deleteAt =null \n" +
                                "WHERE productID = ?")
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
    public void updateProduct( String productID, int quanity){
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE prices SET quanity = ? WHERE product_id = (SELECT productID FROM products WHERE productID = ?);")
                        .bind(1,productID)
                        .bind(0,quanity)
                        .execute()
        );
    }
    public int getQuantityProduct(String productID){
        int result = 0;
        List<Integer> quantities = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT quanity FROM prices INNER JOIN products ON prices.product_id = products.productID WHERE productID = ?")
                        .bind(0, productID)
                        .mapTo(Integer.class)
                        .list()
        );
        if (!quantities.isEmpty()) {
            result = quantities.get(0);
        }
        return result;
    }
//    public Product get(String id) {
//        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
//            return handle.createQuery("SELECT productID,cat_id,`name`,description,vendor_id,`status`,deleteAt, prices.out_price  FROM  products JOIN prices ON products.productID = prices.product_id WHERE productID = ?")
//                    .bind(0,id)
//                    .mapToBean(Product.class).findFirst().orElse(null);
//        });
//        return ImagesService.getInstance().getImgForProducts(pro);
//    }
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

    }


}

