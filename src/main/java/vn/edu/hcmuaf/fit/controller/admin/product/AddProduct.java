package vn.edu.hcmuaf.fit.controller.admin.product;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.VendorsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddProduct", value = "/admin/new_product")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddProduct extends HttpServlet {
    String name = "AddProduct";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("cate", CategoryService.getInstance().listAllCategory());
        request.setAttribute("vendor", VendorsService.getInstance().getVendors());
        request.getRequestDispatcher("add_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ProductService pro = new ProductService();
        String id = pro.getNewID();
        String name = request.getParameter("namep");
        String id_cate = request.getParameter("id_cate");
        String id_vendor = request.getParameter("id_vendor");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String in_price = request.getParameter("in_price");
        String description = request.getParameter("description");
        String img = request.getParameter("img");
        ArrayList<String> a = new ArrayList<>();

        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        int log_id = LogService.getInstances().getNewID() + 1;
        LogService.getInstances().addLog(log_id, Log.INFO, user.getId(), name, "add log");

        Product product;
        if (name != null && id_cate != null && quantity != null && price != null && description != null) {
//            String namecate = CategoryService.getInstance().getNameByID(id_cate);
            ProductService.getInstance().addProduct(id, id_cate, name, id_vendor, img, description, Integer.parseInt(quantity), Integer.parseInt(price), (in_price==null?0: Integer.parseInt(in_price)));
        }
//        response.sendRedirect("/Project_CK_Web/admin/product?id=" + id);
        response.sendRedirect("product-list");
    }
}
