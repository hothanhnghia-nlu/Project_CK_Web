package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddProduct", value = "/admin/new_product")
public class AddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("cate", CategoryService.getInstance().listAllCategory());
        request.getRequestDispatcher("add_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ProductService pro = new ProductService();
        String id = "0"+String.valueOf(Integer.parseInt(pro.getTopNewProduct(5).get(0).getProductID())+1);
        String name = request.getParameter("namep");
        String id_cate = request.getParameter("id_cate");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
        String discription = request.getParameter("discription");
        String img = request.getParameter("img");

        Product product;
        if (name!= null && id_cate!= null && quantity != null && price != null && discription != null){
            String namecate = CategoryService.getInstance().getNameByID(id_cate);
            ProductService.getInstance().addProduct(id,id_cate,name,namecate,img,discription,Integer.parseInt(quantity),Integer.parseInt(price),Integer.parseInt(discount));
        }
        response.sendRedirect("/Project_CK_Web_war/admin/product?id="+id);

    }
}
