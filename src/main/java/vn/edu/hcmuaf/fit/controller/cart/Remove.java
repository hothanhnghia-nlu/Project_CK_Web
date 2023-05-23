package vn.edu.hcmuaf.fit.controller.cart;//package vn.edu.hcmuaf.fit.controller.cart;
//
//import vn.edu.hcmuaf.fit.bean.Cart;
//import vn.edu.hcmuaf.fit.bean.Product;
//import vn.edu.hcmuaf.fit.service.ProductService;
//
//import javax.servlet.*;
//import javax.servlet.http.*;
//import javax.servlet.annotation.*;
//import java.io.IOException;
//
//@WebServlet(name = "Remove", value = "/remove")
//public class Remove extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String id = request.getParameter("pid");
//        Product p = ProductService.getInstance().getProductByID(id);
//        if (p==null || id == null){
//            response.sendRedirect("");
//            return;
//        }
//        HttpSession session = request.getSession(true);
//        vn.edu.hcmuaf.fit.bean.Cart cart = Cart.getCart(session);
////        if (cart == null){
////            cart = new Cart();
////        }
//        cart.remove(id);
//        cart.commit(session);
//
//        response.sendRedirect(request.getHeader("referer"));
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//}
import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "Remove", value = "/remove")
public class Remove extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("pid");
        Product p = ProductService.getInstance().getProductByID(id);
        if (p == null || id == null) {
            response.sendRedirect("");
            return;
        }
        HttpSession session = request.getSession(true);
        Cart cart = Cart.getCart(session);

        cart.remove(id);
        cart.commit(session);

        // Tạo đối tượng JSON chứa giá mới của giỏ hàng
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("total", cart.getTotalMoney());

        // Chuyển đổi đối tượng JSON thành chuỗi JSON
        String jsonResponse = new Gson().toJson(responseData);

        // Thiết lập kiểu dữ liệu và kích thước cho phản hồi
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Gửi chuỗi JSON làm phản hồi
        response.getWriter().write(jsonResponse);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
