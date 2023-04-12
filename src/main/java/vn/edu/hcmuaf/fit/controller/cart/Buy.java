package vn.edu.hcmuaf.fit.controller.cart;

import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Buy", value = "/cart/buy")
public class Buy extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("pid");
        Product p = ProductService.getInstance().getProductByID(id);
        if (p==null || id == null){
            response.sendRedirect("");
            return;
        }
        HttpSession session = request.getSession(true);
        vn.edu.hcmuaf.fit.bean.Cart cart = Cart.getCart(session);
        cart.put(p);
        cart.commit(session);
        response.sendRedirect("/Project_CK_Web_war/cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
