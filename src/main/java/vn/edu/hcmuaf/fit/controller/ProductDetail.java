package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Comment;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.CommentService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "detailControl", value = "/detail")
public class ProductDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("pid");
        ProductService pro = new ProductService();
        Product product = pro.getProductByID(id);
        List<Comment> comment = CommentService.getInstance().listAllComment();
        request.setAttribute("list",ProductService.getInstance().getTopSellerAsVendorID(3,product.getVendor()));
        request.setAttribute("detail",product);
        request.setAttribute("comment", comment);
        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
