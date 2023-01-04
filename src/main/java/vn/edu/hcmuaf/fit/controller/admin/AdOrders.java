package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdOrders", value = "/admin/order-list")
public class AdOrders extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
//        OrderService.getInstance().deleteOrder(id);
//        OrderService.getInstance().deleteAll();

        List<Order> orderList = OrderService.getInstance().getAllOrder();
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("orders.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
