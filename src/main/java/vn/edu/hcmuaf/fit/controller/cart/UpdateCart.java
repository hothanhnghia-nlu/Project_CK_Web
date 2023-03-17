package vn.edu.hcmuaf.fit.controller.cart;

import vn.edu.hcmuaf.fit.bean.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "UpdateCart", value = "/update-cart")
public class UpdateCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Enumeration<String> names = request.getParameterNames();
        while (names.hasMoreElements()){
            String name = names.nextElement();
            int quantity = Integer.parseInt(request.getParameter(name));

            HttpSession seesion = request.getSession();
            Cart cart = (Cart) seesion.getAttribute("cart");
            if (cart!= null){
                cart.update(name,quantity);
            }
        }
        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Enumeration<String> names = request.getParameterNames();
        while (names.hasMoreElements()){
            String name = names.nextElement();
            int quantity = Integer.parseInt(request.getParameter(name));

            HttpSession seesion = request.getSession();
            Cart cart = (Cart) seesion.getAttribute("cart");
            if (cart!= null){
                cart.update(name,quantity);
            }
        }
        response.sendRedirect("cart.jsp");
    }
}
