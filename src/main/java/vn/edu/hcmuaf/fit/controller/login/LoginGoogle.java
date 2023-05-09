package vn.edu.hcmuaf.fit.controller.login;

import vn.edu.hcmuaf.fit.bean.UserGoogle;
import vn.edu.hcmuaf.fit.properties.google.GoogleUtils;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginGoogle", value = "/login-google")
public class LoginGoogle extends HttpServlet {
    String nameLog ="LoginGoogle";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            request.setAttribute("error", "Đăng nhập thất bại!");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        } else {

            String accessToken = GoogleUtils.getToken(code);
            UserGoogle userGoogle = GoogleUtils.getUserInfo(accessToken);
            HttpSession session = request.getSession(true);
            int log_id = LogService.getInstances().getNewID() + 1;
            LogService.getInstances().addLog(log_id,"1", (userGoogle ==null?0: Integer.parseInt(userGoogle.getId())),nameLog,"User ID " + userGoogle.getId()+" login with google");

            session.setAttribute("oAuth", userGoogle);
            response.sendRedirect("home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
