package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ListComment", value = "/list-comment")
public class ListComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list-comment", CommentService.getInstance().listAllComment());
        request.getRequestDispatcher("detail").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
