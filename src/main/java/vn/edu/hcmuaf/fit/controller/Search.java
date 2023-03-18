package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Search", value = "/Search")
public class Search extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("namespace");
        ProductService pro = new ProductService();
        CategoryService cat = new CategoryService();
        List<Product> list = pro.getProductByName(name);

//        response.getWriter().println(list);
        request.setAttribute("list", list);
//        request.setAttribute("listBrand", pro.getAllbrand());
        request.setAttribute("listNew", pro.getTopNewProduct(3));
        request.setAttribute("listCate", cat.listAllCategory());

        request.getRequestDispatcher("list-product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
