package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.OrderDetailService;
import vn.edu.hcmuaf.fit.service.OrderService;
import vn.edu.hcmuaf.fit.service.UserService;

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
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        if (auth == null || !auth.checkRole(1)) {
            response.sendRedirect("not-found");
        } else {
            if (id != null) {
                OrderService.getInstance().deleteOrder(Integer.parseInt(id));
                OrderDetailService.getInstance().deleteOrderDetail(Integer.parseInt(id));
                // Trả về phản hồi JSON để xác nhận xóa thành công
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"success\": true}");
                return;
            }
            List<Order> orderList = OrderService.getInstance().getAllOrder();
            request.setAttribute("orderList", orderList);
            request.getRequestDispatcher("orders.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String status = request.getParameter("status");
        String id = request.getParameter("id");

        if (status != null){
            OrderService.getInstance().updateStatus(Integer.parseInt(id), Integer.parseInt(status));
        }
        response.sendRedirect("order-list");
    }
}
