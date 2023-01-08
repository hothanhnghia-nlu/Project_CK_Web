package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.service.MailService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ResetPass", value = "/resetPass")
public class ResetPass extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String subject = "Password Recovery";
        String content = "Hi, we provide your username and password again:\n"
                + UserService.getInstances().getUsernameAndPassword(email);
        boolean emailExist = UserService.getInstances().checkEmailExist(email);

        if (!emailExist) {
            request.setAttribute("error", "Email không tồn tại! Vui lòng nhập lại email!");
            request.getRequestDispatcher("forgot-password.jsp").forward(request,response);
        } else {
            MailService.sendMail(email, subject, content);
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
