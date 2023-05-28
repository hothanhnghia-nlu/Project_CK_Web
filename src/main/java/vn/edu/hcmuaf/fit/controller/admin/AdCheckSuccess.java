package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.service.API_LOGISTIC.RegisterTransport;
import vn.edu.hcmuaf.fit.service.API_LOGISTIC.SignIn;
import vn.edu.hcmuaf.fit.service.API_LOGISTIC.Transport;
import vn.edu.hcmuaf.fit.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdCheckSuccess", value = "/admin/check-success")
public class AdCheckSuccess extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = request.getParameter("status");
        String orderId = request.getParameter("orderId");
        int oid = Integer.parseInt(orderId);
        int st = Integer.parseInt(status);

        OrderService.getInstance().updateStatus(oid, st);
        int numTrans = OrderService.getInstance().getNumTrans(oid);
        if (st == 1 && numTrans == 0) {
            Order order = new Order();
            order.setOrderId(oid);
            SignIn signIn = new SignIn();
            String API_KEY = signIn.signIn();
            RegisterTransport register = new RegisterTransport();
            Transport transport = register.registerTransport(API_KEY, order, null, null, null, null);
            OrderService.getInstance().addTransport(transport);
        }
        response.sendRedirect("admin/check-order");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
