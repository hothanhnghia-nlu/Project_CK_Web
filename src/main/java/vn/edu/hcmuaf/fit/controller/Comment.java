package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CommentService;
import vn.edu.hcmuaf.fit.service.ContactService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Comment", value = "/comment")
public class Comment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        int rating = Integer.parseInt(request.getParameter("rating"));

//        String id = ""+(ContactService.getInstances().getNewID()+1);
//        CommentService.getInstance().insert(id, name, email, subject, content, rating);
//        response.sendRedirect("detail");
        String id = request.getParameter("id");
        if(id!=null){
            CommentService.getInstance().deleteComment(id);
        }
        request.setAttribute("commentList", CommentService.getInstance().listAllComment());
        request.getRequestDispatcher("").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
