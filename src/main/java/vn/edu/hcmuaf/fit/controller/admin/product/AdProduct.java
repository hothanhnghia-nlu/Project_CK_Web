package vn.edu.hcmuaf.fit.controller.admin.product;

import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.OrderService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdProduct", value = "/admin/product-list")
public class AdProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        if (auth == null || !auth.checkRole(1)) {
            response.sendRedirect("not-found");
        } else {
            List<Product> proList = ProductService.getInstance().listAllProduct();
            request.setAttribute("proList", proList);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
