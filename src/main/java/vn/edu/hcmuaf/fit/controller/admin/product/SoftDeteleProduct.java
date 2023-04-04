package vn.edu.hcmuaf.fit.controller.admin.product;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SoftDeleteProduct", value = "/admin/product-soft-delete")
public class SoftDeteleProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ProductService.getInstance().deleteSoftProduct(id);
        response.sendRedirect("product-list");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
