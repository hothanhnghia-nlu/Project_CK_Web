package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.UserService;

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
        password = UserService.getInstances().hashPassword(password);
        User user = UserService.getInstances().checkLogin(username, password);
        int log_id = LogService.getInstances().getNewID() + 1;

        HttpSession session = request.getSession();
        Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");

        if (user == null) {
            // Check login attempts -- case 1: login attempts null
            if (loginAttempts == null) {
                session.setAttribute("loginAttempts", 0);
            } else if (loginAttempts >= 3) { // case 2: login attempts >= 3
                LogService.getInstances().addLog(log_id, "2", 0, "account blocked", "Username= " + username);
                request.setAttribute("error", "Tài khoản tạm thời bị khóa. Vui lòng đăng nhập lại sau!");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            } else {
                session.setAttribute("loginAttempts", loginAttempts + 1);
            }
            LogService.getInstances().addLog(log_id, "2", 0, "login false", "Username= " + username);
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("log-in").forward(request, response);
        } else {
            session.setAttribute("auth", user);
            LogService.getInstances().addLog(log_id, "1", user.getId(), "login success", "Username= " + username);
            if (user.checkRole(3)) {
                response.sendRedirect("admin/ad_statistic.jsp");
            } else {
                response.sendRedirect("home");
            }
            session.setAttribute("loginAttempts", 0);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
