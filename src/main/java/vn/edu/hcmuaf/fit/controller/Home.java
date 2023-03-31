package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Home", value = "/home")
public class Home extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService pro = new ProductService();
        CategoryService cat = new CategoryService();

        request.setAttribute("listTop", pro.getTopProduct(10));
        request.setAttribute("listSeller", pro.getTopSeller(10));
        request.setAttribute("listNew", pro.getTopNewProduct(10));
        //chuyen huong trang tim kiem
        String name = request.getParameter("namespace");
        if(name!=null)
            response.sendRedirect("/Project_CK_Web/Search?namespace="+name);
//            response.sendRedirect("/Project_CK_Web_war/Search?namespace="+name);
        else  request.getRequestDispatcher("home.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
