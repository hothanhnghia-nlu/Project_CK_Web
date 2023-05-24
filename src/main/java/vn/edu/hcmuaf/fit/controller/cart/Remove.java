package vn.edu.hcmuaf.fit.controller.cart;

import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Remove", value = "/remove")
public class Remove extends HttpServlet {
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
        if (cart == null){
            cart = new Cart();
        }
        cart.remove(id);
        cart.commit(session);

        response.sendRedirect(request.getHeader("referer"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
