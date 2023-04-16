package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.CommentService;
import vn.edu.hcmuaf.fit.service.ContactService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdContact", value = "/admin/contacts")
public class AdContact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        if (auth == null || !auth.checkRole(1)) {
            response.sendRedirect("not-found");
        } else {
            if (id != null) {
                ContactService.getInstances().delete(id);
            }
            request.setAttribute("contactList", ContactService.getInstances().selectAll());
            request.getRequestDispatcher("contact-us.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
