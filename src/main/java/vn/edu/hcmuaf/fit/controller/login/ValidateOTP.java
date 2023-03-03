package vn.edu.hcmuaf.fit.controller.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ValidateOTP", value = "/validateOTP")
public class ValidateOTP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");

        if (value == otp) {
            request.setAttribute("email", request.getParameter("email"));
            response.sendRedirect("new-password.jsp");
        } else {
            request.setAttribute("message", "Mã OTP không đúng!");
            request.getRequestDispatcher("enterOTP.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
