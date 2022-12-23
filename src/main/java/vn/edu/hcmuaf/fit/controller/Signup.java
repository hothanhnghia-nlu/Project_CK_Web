package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Signup", value = "/signup")
public class Signup extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        String rePass = request.getParameter("repass");
        if (!password.equals(rePass)) {
            request.setAttribute("error", "Mật khẩu xác nhận không đúng");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            boolean checkExist = AccountService.getInstances().checkAccountExist(username);
            if (checkExist == false) {
                AccountService.getInstances().register(username, password, email);
                response.sendRedirect("success-signup.jsp");
            } else {
                request.setAttribute("error", "Tài khoản đã tồn tại");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
