package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Home", value = "/home")
public class Home extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService pro = new ProductService();
        CategoryService cat = new CategoryService();

        request.setAttribute("listTop", pro.getTopProduct(20));
        request.setAttribute("listSeller", pro.getTopSeller(20));
        request.setAttribute("listNew", pro.getTopNewProduct(20));
        //chuyen huong trang tim kiem
        String name = request.getParameter("namespace");
        if(name!=null)
            response.sendRedirect("Search?namespace="+name);
        else  request.getRequestDispatcher("home.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
