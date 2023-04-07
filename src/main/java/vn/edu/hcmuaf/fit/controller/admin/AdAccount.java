package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdAccount", value = "/admin/accounts")
public class AdAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id!= null){
            UserService.getInstances().deleteUser(id);
        }
        List<User> userList = UserService.getInstances().listALlUser();
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("table_account.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String role = request.getParameter("role");
        String id = request.getParameter("id");

        if (role!=null){
            UserService.getInstances().updateID(Integer.parseInt(id), Integer.parseInt(role));
        }
        response.sendRedirect("accounts");
    }
}
