package vn.edu.hcmuaf.fit.bean;

import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class Cart implements Serializable {
    HashMap<String, Product> listProduct;
    User customer;
    long totalMoney;
    int quantity;

    public Cart() {
        listProduct = new HashMap<>();
        customer = new User();
        totalMoney = 0;
        quantity = 0;
    }

    public Cart(User customer, long totalMoney, int quantity) {
        this.listProduct = new HashMap<>();
        this.customer = customer;
        this.totalMoney = totalMoney;
        this.quantity = quantity;
    }

    public double getTotalMoney() {
        double sum = 0;
        for (Product p : listProduct.values()) {
            sum += (p.getOut_price() * p.getQuantity());
        }
        return sum;
    }

    public int getQuantity() {
        return quantity;
    }

    public Collection<Product> getListProduct(){
        return listProduct.values();
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
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
            totalMoney += p.getQuantity() * p.getOut_price();
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
