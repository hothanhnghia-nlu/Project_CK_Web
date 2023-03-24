package vn.edu.hcmuaf.fit.controller.profile;

import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MyProfile", value = "/my-profile")
public class MyProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
        String email = UserService.getInstances().getUserEmail();

        UserService.getInstances().updateUserInfo(email, address, birthday);
        request.getRequestDispatcher("my-profile.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
