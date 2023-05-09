package vn.edu.hcmuaf.fit.controller.cart;

import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.OrderService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Map;

import static java.lang.System.out;

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
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Enumeration<String> names = request.getParameterNames();
//        while (names.hasMoreElements()){
//            String name = names.nextElement();
//            int quantity = Integer.parseInt(request.getParameter(name));
//
//            HttpSession seesion = request.getSession();
//            Cart cart = (Cart) seesion.getAttribute("cart");
//
//            if (cart!= null){
//                Collection<Product> list = cart.getListProduct();
//                for (Product p: list){
//                    int sumquantity = ProductService.getInstance().getQuantityProduct(p.getProductID());
//                    if(quantity > sumquantity){
//                        String message = "Số lượng sản phẩm không đủ";
//                        request.setAttribute("message", message);
//
//                    }else {
//                        cart.update(name,quantity);
//                    }
//                }
//
//            }
//        }
//        response.sendRedirect("cart.jsp");
//    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart != null) {
            Map<String, String[]> parameterMap = request.getParameterMap();
            for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
                String productId = entry.getKey();
                int quantity = Integer.parseInt(entry.getValue()[0]);

                int sumquantity = ProductService.getInstance().getQuantityProduct(productId);
                if (quantity > sumquantity) {
                    request.setAttribute("error", "Số lượng sản phẩm không đủ");
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                } else {
                    cart.update(productId, quantity);
                    response.sendRedirect("cart.jsp");
                }
            }
        }
    }
}
