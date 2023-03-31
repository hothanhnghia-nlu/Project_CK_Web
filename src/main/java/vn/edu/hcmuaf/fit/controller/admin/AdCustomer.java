package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdCustomer", value = "/admin/customers")
public class AdCustomer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null){
            UserService.getInstances().deleteUser(id);
        }
        List<User> userList = UserService.getInstances().listALlUser();
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("table_user.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
