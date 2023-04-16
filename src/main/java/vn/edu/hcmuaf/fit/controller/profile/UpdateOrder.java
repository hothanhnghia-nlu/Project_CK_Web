package vn.edu.hcmuaf.fit.controller.profile;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.OrderDetail;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.OrderDetailService;
import vn.edu.hcmuaf.fit.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateOrder", value = "/update-order")
public class UpdateOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User email = (User) session.getAttribute("auth");
        int id = OrderService.getInstance().getOrderId(email.getEmail());

        List<Order> orderList = OrderService.getInstance().getOrderByEmail(email.getEmail());
        request.setAttribute("orderList", orderList);

        List<OrderDetail> orderDetailList = OrderDetailService.getInstance().getOrderDetailByID(id);
        request.setAttribute("orderDetailList", orderDetailList);

        request.getRequestDispatcher("my-order.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
