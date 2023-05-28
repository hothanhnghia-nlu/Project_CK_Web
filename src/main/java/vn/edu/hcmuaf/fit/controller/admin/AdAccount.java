//package vn.edu.hcmuaf.fit.controller.admin;
//
//import vn.edu.hcmuaf.fit.bean.User;
//import vn.edu.hcmuaf.fit.service.UserService;
//
//import javax.servlet.*;
//import javax.servlet.http.*;
//import javax.servlet.annotation.*;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet(name = "AdAccount", value = "/admin/accounts")
//public class AdAccount extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String id = request.getParameter("id");
//        HttpSession session = request.getSession();
//        User auth = (User) session.getAttribute("auth");
//
//        if (auth == null || !auth.checkRole(3)) {
//            response.sendRedirect("not-found");
//        } else {
//            if (id != null) {
//                UserService.getInstances().deleteUser(id);
//            }
//            List<User> userList = UserService.getInstances().listALlUser();
//            request.setAttribute("userList", userList);
//            request.getRequestDispatcher("table_account.jsp").forward(request, response);
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        String role = request.getParameter("role");
//        String id = request.getParameter("id");
//
//        if (role!=null){
//            UserService.getInstances().updateID(Integer.parseInt(id), Integer.parseInt(role));
//        }
//        response.sendRedirect("accounts");
//    }
//}
package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdAccount", value = "/admin/accounts")
public class AdAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        if (auth == null || !auth.checkRole(3)) {
            response.sendRedirect("not-found");
        } else {
            if (id != null) {
                UserService.getInstances().deleteUser(id);

                // Trả về phản hồi JSON để xác nhận xóa thành công
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"success\": true}");
                return;
            }

            // Lấy danh sách người dùng
            List<User> userList = UserService.getInstances().listALlUser();
            request.setAttribute("userList", userList);
            request.getRequestDispatcher("table_account.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String role = request.getParameter("role");
        String id = request.getParameter("id");

        if (role != null) {
            UserService.getInstances().updateID(Integer.parseInt(id), Integer.parseInt(role));
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": true}");
            return;
        }
        response.sendRedirect("accounts");
    }
}
