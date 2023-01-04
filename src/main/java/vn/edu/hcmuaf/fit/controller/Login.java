package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Account;
import vn.edu.hcmuaf.fit.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Account account = AccountService.getInstances().checkLogin(username, password);

        if (account == null) {
            request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", account);
            response.sendRedirect("home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
