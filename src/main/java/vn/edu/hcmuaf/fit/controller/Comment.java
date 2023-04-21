package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.CommentService;
import vn.edu.hcmuaf.fit.service.ContactService;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Comment", value = "/comment")
public class Comment extends HttpServlet {
    String nameLog = "Comment";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pName = request.getParameter("productName");
        String content = request.getParameter("content");
        int rating = Integer.parseInt(request.getParameter("rating"));

        int id = CommentService.getInstance().getNewID() + 1;
        CommentService.getInstance().addCmt(id, name, email, pName, content, rating);
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        int log_id = LogService.getInstances().getNewID() + 1;
        LogService.getInstances().addLog(log_id,"1", (user==null?0:user.getId()),nameLog,"id= "+id + " | name= "+name+ " | email = " +email+" | Product name ="+ pName+" | content = " +content+" | rating = "+rating);

        response.sendRedirect("home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
