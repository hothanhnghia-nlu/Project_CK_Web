package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.VendorsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Search", value = "/Search")
public class Search extends HttpServlet {
    String nameLog = "Search";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("namespace");
        ProductService pro = new ProductService();
        CategoryService cat = new CategoryService();

        List<Product> list = pro.getProductByName(name);
        request.setAttribute("list", list);
        request.setAttribute("listSeller", pro.getTopSeller(3));
        request.setAttribute("listCate", cat.listAllCategory());
        request.setAttribute("listVendor", VendorsService.getInstance().getVendors());
        //log
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        int log_id = LogService.getInstances().getNewID() + 1;
        LogService.getInstances().addLog(log_id, Log.INFO, (user==null?0:user.getId()),nameLog, list.toString());
        request.getRequestDispatcher("list-product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
