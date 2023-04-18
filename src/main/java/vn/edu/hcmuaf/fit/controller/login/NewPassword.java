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
        User user = (User) session.getAttribute("auth");
        if (newPassword != null && rePassword != null && newPassword.equals(rePassword)) {
            newPassword = UserService.getInstances().hashPassword(newPassword);
            UserService.getInstances().updatePassword(email, newPassword);

            int log_id = LogService.getInstances().getNewID() + 1;
            LogService.getInstances().addLog(log_id,"1", (user ==null?0: user.getId()),nameLog,"User ID " + user.getId()+" new password");

            response.sendRedirect("login.jsp");
        } else {
            int log_id = LogService.getInstances().getNewID() + 1;
            LogService.getInstances().addLog(log_id,"1", (user ==null?0: user.getId()),nameLog,"User ID " + user.getId()+" Wrong confirmation password");
            request.setAttribute("error", "Mật khẩu xác nhận không đúng!");
            request.getRequestDispatcher("new-password.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
