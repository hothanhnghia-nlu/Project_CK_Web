package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.OrderDetail;
import vn.edu.hcmuaf.fit.service.OrderDetailService;
import vn.edu.hcmuaf.fit.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdOrder_detail", value = "/admin/order-detail")
public class AdOrder_detail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
//        OrderService.getInstance().deleteOrder(id);
//        OrderService.getInstance().deleteAll();

        List<OrderDetail> orderList = OrderDetailService.getInstance().getOrderDetailByID(id);
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("order_detail.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
