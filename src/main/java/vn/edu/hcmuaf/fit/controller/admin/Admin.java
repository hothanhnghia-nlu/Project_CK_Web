package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Admin", value = "/admin")
public class Admin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        if (auth == null || !auth.checkRole(1)) {
            response.sendRedirect("page-not-found");
        }
        else if(auth.checkRole(1)) {
            response.sendRedirect("admin/product-list");
        }
        else if(auth.checkRole(2) || auth.checkRole(3)) {
            response.sendRedirect("admin/statistic.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
