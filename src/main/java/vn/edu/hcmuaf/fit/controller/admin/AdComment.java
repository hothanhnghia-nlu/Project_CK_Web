package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.service.CommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AcComment", value = "/admin/comment")
public class AdComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        OrderService.getInstance().deleteOrder(id);
//        OrderService.getInstance().deleteAll();
        String id = request.getParameter("id");
        if(id!=null){
            CommentService.getInstance().deleteComment(id);
        }
        request.setAttribute("commentList", CommentService.getInstance().listAllComment());
        request.getRequestDispatcher("comment.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
