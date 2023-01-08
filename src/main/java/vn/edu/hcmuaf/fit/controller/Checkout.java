package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

@WebServlet(name = "Checkout", value = "/checkout")
public class Checkout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        String name = request.getParameter("name");
//        String email = request.getParameter("email");
//        String phone = request.getParameter("phone");
//        String address = request.getParameter("address");
//        String note = request.getParameter("note");
//
//        OrderService.getInstance().addOrder(name, email, phone, address, note);
//        response.sendRedirect("success.jsp");

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

        String id = ""+(OrderService.getInstance().getNewID()+1);
        OrderService.getInstance().addOrder(id,name,phone,email,address,note);
        for (Product p: list){
            int discount = p.getDiscount()==0?p.getPrice():p.getDiscount();
            OrderService.getInstance().addOrderDetails(id, p.getProductID(),p.getQuantity(),discount);
        }

//        response.sendRedirect("/Project_CK_Web_war/success.jsp");
        response.sendRedirect("/Project_CK_Web/success.jsp");
    }
}
