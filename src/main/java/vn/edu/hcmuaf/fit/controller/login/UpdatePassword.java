package vn.edu.hcmuaf.fit.controller.login;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdatePassword", value = "/update-password")
public class UpdatePassword extends HttpServlet {
    String nameLog = "UpdatePassword";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPass = request.getParameter("new-pass");
        String rePass = request.getParameter("repass");
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        if (newPass.equals(rePass)) {
            newPass = UserService.getInstances().hashPassword(newPass);
            UserService.getInstances().updatePassword(auth.getEmail(), newPass);

            int log_id = LogService.getInstances().getNewID() + 1;
            LogService.getInstances().addLog(log_id,"1", (auth ==null?0: auth.getId()),nameLog,"User ID " + auth.getId()+"Update Password");

            session.removeAttribute("auth");
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "Mật khẩu không đúng!");
            request.getRequestDispatcher("change-pass.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
