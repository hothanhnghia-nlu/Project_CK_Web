package vn.edu.hcmuaf.fit.controller.login;

import vn.edu.hcmuaf.fit.bean.UserGoogle;
import vn.edu.hcmuaf.fit.properties.google.GoogleUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginGoogle", value = "/login-google")
public class LoginGoogle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            request.setAttribute("error", "Đăng nhập thất bại!");
            request.getRequestDispatcher("log-in").forward(request,response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            UserGoogle userGoogle = GoogleUtils.getUserInfo(accessToken);
            HttpSession session = request.getSession(true);
            session.setAttribute("oAuth", userGoogle);
            response.sendRedirect("home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
