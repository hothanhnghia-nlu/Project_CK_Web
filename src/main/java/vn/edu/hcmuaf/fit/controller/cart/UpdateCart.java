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
        response.sendRedirect("shopping-cart");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart != null) {
            Map<String, String[]> parameterMap = request.getParameterMap();
            boolean hasError = false; // biến cờ để kiểm tra lỗi

            for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
                String productId = entry.getKey();
                int quantity = Integer.parseInt(entry.getValue()[0]);

                int sumQuantity = ProductService.getInstance().getQuantityProduct(productId);
                if (quantity > sumQuantity) {
                    request.setAttribute("error", "Số lượng sản phẩm không đủ");
                    hasError = true; // đặt biến cờ khi có lỗi
                } else {
                    cart.update(productId, quantity);
                }
            }
            if (hasError) {
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            } else {
                response.sendRedirect("cart.jsp");
            }
        }

    }
}
