package vn.edu.hcmuaf.fit.controller.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EnterOTP", value = "/enter-OTP")
public class EnterOTP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("enterOTP.jsp").forward(request,response);
    }
}
