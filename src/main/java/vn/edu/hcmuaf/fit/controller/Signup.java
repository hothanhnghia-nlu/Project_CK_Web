package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.ContactService;
import vn.edu.hcmuaf.fit.service.LogService;
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
        int log_id = LogService.getInstances().getNewID() + 1;

        //log
        if (!password.equals(rePass)) {
            request.setAttribute("error", "Mật khẩu xác nhận không đúng!");
            request.getRequestDispatcher("sign-up").forward(request, response);
        } else {
            boolean accountExist = UserService.getInstances().checkAccountExist(username);
            boolean emailExist = UserService.getInstances().checkEmailExist(email);
            if (!accountExist && !emailExist) {
                password = UserService.getInstances().hashPassword(password);
                String id = "" + (UserService.getInstances().getNewID() + 1);
                UserService.getInstances().register(id, name, email, phone, username, password);
                LogService.getInstances().addLog(log_id, Log.INFO, Integer.parseInt(id),"Signup success","id= "+id+" username= "+username);
                response.sendRedirect("success-signup");
            } else {
                LogService.getInstances().addLog(log_id, Log.ALERT, 0,"Signup wrong","name= "+name+"email= "+email+"phone= "+phone+ "username= "+username);
                request.setAttribute("error", "Tài khoản đã tồn tại!");
                request.getRequestDispatcher("sign-up").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
