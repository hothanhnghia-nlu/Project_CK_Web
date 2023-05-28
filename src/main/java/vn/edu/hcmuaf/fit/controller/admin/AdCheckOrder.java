package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.API_LOGISTIC.RegisterTransport;
import vn.edu.hcmuaf.fit.service.API_LOGISTIC.SignIn;
import vn.edu.hcmuaf.fit.service.API_LOGISTIC.Transport;
import vn.edu.hcmuaf.fit.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdCheckOrder", value = "/admin/check-order")
public class AdCheckOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        if (auth == null || !auth.checkRole(1)) {
            response.sendRedirect("not-found");
        } else {
            OrderService.getInstance().updateOrderStatusByTransportLeadTime();
            List<Order> listOrders = OrderService.getInstance().getAllOrder();
            request.setAttribute("listOrders", listOrders);
            request.getRequestDispatcher("check-order.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String status = request.getParameter("status");
        String id = request.getParameter("id");

        if (status != null) {
            OrderService.getInstance().updateStatus(Integer.parseInt(id), Integer.parseInt(status));
        }
        response.sendRedirect("check-order");
    }
}
