package vn.edu.hcmuaf.fit.controller.profile;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.bean.UserGoogle;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MyProfile", value = "/my-profile")
public class MyProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");
        UserGoogle oAuth = (UserGoogle) session.getAttribute("oAuth");

        if (auth == null && oAuth == null) {
            response.sendRedirect("page-not-found");
        } else {
            UserService.getInstances().listALlUser();
            request.getRequestDispatcher("my-profile.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
