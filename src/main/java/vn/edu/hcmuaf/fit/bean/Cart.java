package vn.edu.hcmuaf.fit.bean;

import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class Cart implements Serializable {
    HashMap<String, Product> listProduct;
    Customer customer;
    long totalMoney;
    int quantity;

    public Cart() {
        listProduct = new HashMap<>();
        customer = new Customer();
        totalMoney = 0;
        quantity = 0;
    }

    public Cart( Customer customer, long totalMoney, int quantity) {
        this.listProduct = new HashMap<>();
        this.customer = customer;
        this.totalMoney = totalMoney;
        this.quantity = quantity;
    }

    public double getTotalMoney() {
        double sum = 0;
        for (Product p : listProduct.values()) {
            if(p.getDiscount() == 0) {
                sum += p.getPrice() * p.getQuantity();
            }else{
                sum += p.getDiscount() * p.getQuantity();
            }
        }
        return sum;
    }

    public int getQuantity() {
        return quantity;
    }
    public Collection<Product> getListProduct(){
        return listProduct.values();
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    public void put(Product product){
        String key = product.getKey();
        if (listProduct.containsKey(key)){
            Product p = listProduct.get(key);
            p.setQuantity(p.getQuantity()+1);
        }else{
            listProduct.put(key, product);
            Product p = listProduct.get(key);
            p.setQuantity(1);
        }
        updateTotalMoneyAnQuatity();
    }
    public void update(String key, int quantity){
        if(listProduct.containsKey(key)){
            Product p = listProduct.get(key);
            p.setQuantity(quantity);
        }
        updateTotalMoneyAnQuatity();

    }
    public void remove(String key){
            listProduct.remove(key);
            updateTotalMoneyAnQuatity();
    }
    private void updateTotalMoneyAnQuatity(){
        totalMoney = 0;
        quantity = 0;
        for (Product p: listProduct.values()) {
            totalMoney += p.getQuantity() * p.getPrice();
            quantity += p.getQuantity();
        }
    }
    public static Cart getCart(HttpSession session) {
        return session.getAttribute("cart") == null ? new Cart() : (Cart) session.getAttribute("cart");
    }

    public void commit(HttpSession session) {
        session.setAttribute("cart", this);
    }
}
