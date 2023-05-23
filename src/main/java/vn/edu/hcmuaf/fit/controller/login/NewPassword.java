package vn.edu.hcmuaf.fit.controller.login;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NewPassword", value = "/new-password")
public class NewPassword extends HttpServlet {
    String nameLog = "NewPassword";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("newPass");
        String rePassword = request.getParameter("rePass");
        String email = (String) session.getAttribute("email");
        int log_id = LogService.getInstances().getNewID() + 1;

        if (newPassword != null && rePassword != null && newPassword.equals(rePassword)) {
            newPassword = UserService.getInstances().hashPassword(newPassword);
            UserService.getInstances().updatePassword(email, newPassword);
            response.sendRedirect("log-in");
        } else {
            request.setAttribute("error", "Mật khẩu xác nhận không đúng!");
            request.getRequestDispatcher("new-password.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
