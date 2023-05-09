package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.OrderService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "Checkout", value = "/checkout")
public class Checkout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("checkout.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        vn.edu.hcmuaf.fit.bean.Cart cart = (vn.edu.hcmuaf.fit.bean.Cart) request.getSession().getAttribute("cart");
        Collection<Product> list = cart.getListProduct();
        String name = request.getParameter("name");
        String email= request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        String payment = request.getParameter("payment");

        int id = OrderService.getInstance().getNewID() + 1;
        OrderService.getInstance().addOrder(id,name,phone,email,address,note, payment);
        for (Product p: list){
            double price = p.getOut_price();
            int sumquantity = ProductService.getInstance().getQuantityProduct(p.getProductID());
            OrderService.getInstance().addOrderDetails(id, p.getProductID(),p.getQuantity(),price);
            int newquantity = sumquantity - p.getQuantity();
            ProductService.getInstance().updateProduct(p.getProductID(), newquantity);
        }
        session.removeAttribute("cart");
        response.sendRedirect("order-success");
    }
}
