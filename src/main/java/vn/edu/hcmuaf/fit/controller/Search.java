package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.VendorsService;

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

        request.setAttribute("list", list);
        request.setAttribute("listNew", pro.getTopNewProduct(3));
        request.setAttribute("listCate", cat.listAllCategory());
        request.setAttribute("listVendor", VendorsService.getInstance().getVendors());

//        request.getRequestDispatcher("list-product.jsp").forward(request,response);
        request.getRequestDispatcher("list-product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
