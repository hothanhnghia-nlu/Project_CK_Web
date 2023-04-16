package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdDetailProduct", value = "/admin/product")
public class AdDetailProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        if (auth == null || !auth.checkRole(1)) {
            response.sendRedirect("not-found");
        } else {
            ProductService pro = new ProductService();
            Product product = pro.getProductByID(id);
            request.setAttribute("cate", CategoryService.getInstance().listAllCategory());
            request.setAttribute("detail", product);
            request.getRequestDispatcher("detail_product.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String idpro = request.getParameter("idPro");
        String name = request.getParameter("namep");
        String id_cate = request.getParameter("id_cate");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
        String discription = request.getParameter("discription");
        String img = request.getParameter("img");
        String image = request.getParameter("image");
        ProductService pro = new ProductService();
        Product product;
        if(img==""){
            img = image;
        }
        if (name!= null && id_cate!= null && quantity != null && price != null && discription != null){
            String namecate = CategoryService.getInstance().getNameByID(id_cate);
            ProductService.getInstance().setProduct(idpro,id_cate,name,namecate,img,discription,Integer.parseInt(quantity),Integer.parseInt(price),Integer.parseInt(discount));
            id=idpro;
        }
        product = pro.getProductByID(id);
        request.setAttribute("cate", CategoryService.getInstance().listAllCategory());
        request.setAttribute("detail",product);
        request.getRequestDispatcher("detail_product.jsp").forward(request, response);

    }
}
