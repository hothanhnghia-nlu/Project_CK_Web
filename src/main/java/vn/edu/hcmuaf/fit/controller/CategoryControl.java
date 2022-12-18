package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryControl", value = "/Category")
public class CategoryControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String[] cateID = request.getParameterValues("cateID");
        response.getWriter().println(cateID);
//        response.getWriter().println(list);
//        request.setAttribute("list", list);
//        request.setAttribute("listBrand", pro.getAllbrand());
//        request.setAttribute("listNew", pro.getTop3NewProduct());
//        request.setAttribute("listCate", cat.listAllCategory());
//        request.getRequestDispatcher("ListProduct.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
