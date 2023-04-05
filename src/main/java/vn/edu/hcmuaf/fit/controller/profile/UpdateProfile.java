package vn.edu.hcmuaf.fit.controller.profile;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateProfile", value = "/update-profile")
public class UpdateProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
        HttpSession session = request.getSession(true);
        User email = (User) session.getAttribute("auth");

        UserService.getInstances().updateUserInfo(email.getEmail(), address, birthday);
        request.getRequestDispatcher("my-profile").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
