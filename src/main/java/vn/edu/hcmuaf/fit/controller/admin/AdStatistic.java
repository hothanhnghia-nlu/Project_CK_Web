package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.OrderService;
import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.service.VendorsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdStatistic", value = "/admin/statistic")
public class AdStatistic extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        if (auth == null || !auth.checkRole(2)) {
            response.sendRedirect("not-found");
        } else {
            List<Order> orderList = OrderService.getInstance().getTop5Order();

            request.setAttribute("vendorList", VendorsService.getInstance().getVendorsStatistic());
            request.setAttribute("orderList", orderList);
            request.getRequestDispatcher("statistic.jsp").forward(request, response);
//            List<User> userList = UserService.getInstances().listALlUser();
//            int numUser = userList.size();
//            request.setAttribute("userList",userList);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
