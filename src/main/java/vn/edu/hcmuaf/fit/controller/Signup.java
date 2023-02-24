package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Signup", value = "/signup")
public class Signup extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String rePass = request.getParameter("repass");

        if (!password.equals(rePass)) {
            request.setAttribute("error", "Mật khẩu xác nhận không đúng!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            boolean accountExist = UserService.getInstances().checkAccountExist(username);
            boolean emailExist = UserService.getInstances().checkEmailExist(email);
            if (!accountExist || !emailExist) {
                password = UserService.getInstances().hashPassword(password);
                UserService.getInstances().register(name, email, phone, username, password);
                response.sendRedirect("success-signup.jsp");
            } else {
                request.setAttribute("error", "Tài khoản đã tồn tại!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
