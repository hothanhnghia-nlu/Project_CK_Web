package vn.edu.hcmuaf.fit.controller.profile;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.bean.UserGoogle;
import vn.edu.hcmuaf.fit.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyOrder", value = "/my-order")
public class MyOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");
        UserGoogle oAuth = (UserGoogle) session.getAttribute("oAuth");

        if (auth == null && oAuth == null) {
            response.sendRedirect("page-not-found");
        } else {
            List<Order> orderList = OrderService.getInstance().getAllOrder();
            request.setAttribute("orderList", orderList);
            request.getRequestDispatcher("update-order").forward(request, response);
        }
    }
}
