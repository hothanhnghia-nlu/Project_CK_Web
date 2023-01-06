package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Feedback;
import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.service.CommentService;
import vn.edu.hcmuaf.fit.service.OrderService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AcComment", value = "/admin/comment")
public class AcComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        OrderService.getInstance().deleteOrder(id);
//        OrderService.getInstance().deleteAll();
        String id = request.getParameter("id");
        if(id!=null){
            CommentService.getInstance().deleteFeedback(id);
        }
        request.setAttribute("commentList", CommentService.getInstance().listAllComment());
        request.getRequestDispatcher("comment.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
