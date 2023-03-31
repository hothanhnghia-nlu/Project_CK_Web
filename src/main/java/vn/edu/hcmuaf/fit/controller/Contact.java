package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ContactService;
import vn.edu.hcmuaf.fit.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Contact", value = "/contact")
public class Contact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("contacts.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");

        int id = ContactService.getInstances().getNewID() + 1;
        ContactService.getInstances().insert(id, name, phone, email, subject, content);
        response.sendRedirect("home");
    }
}
