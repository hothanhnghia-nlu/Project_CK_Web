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

@WebServlet(name = "ListProduct", value = "/list-product")
public class ListProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idCat = request.getParameter("idCat");
        String idVendor = request.getParameter("idVendor");
        ProductService pro = new ProductService();
        CategoryService cat = new CategoryService();

        List<Product> list ;
        if(idCat==null){
            list = pro.listAllProduct();
        } else {if(idVendor==null){
            list = pro.getProductByCAT_ID(idCat);
        }else list = pro.getProductByCat_Id_And_Vendor(idCat,idVendor);
        }
        request.setAttribute("list", list);
        request.setAttribute("listNew", pro.getTopNewProduct(3));
        request.setAttribute("listCate", cat.listAllCategory());
        request.setAttribute("listVendor", VendorsService.getInstance().getVendors());

        //chuyen huong trang tim kiem
        String name = request.getParameter("namespace");
        if(name!=null)
        response.sendRedirect("/Project_CK_Web/Search?namespace="+name);
        else request.getRequestDispatcher("list-product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
