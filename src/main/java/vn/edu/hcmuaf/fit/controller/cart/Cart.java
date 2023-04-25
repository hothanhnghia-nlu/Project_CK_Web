package vn.edu.hcmuaf.fit.controller.cart;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

@WebServlet(name = "Cart", value = "/cart")
public class Cart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        vn.edu.hcmuaf.fit.bean.Cart cart = (vn.edu.hcmuaf.fit.bean.Cart) request.getSession().getAttribute("cart");
        Collection<Product> list = cart.getListProduct();
        double total = cart.getTotalMoney();
        boolean checkList = list.isEmpty();
        List<Category> listCate = CategoryService.getInstance().listAllCategory();
        request.setAttribute("list",list);
        request.setAttribute("check",checkList);
        request.setAttribute("total",total);
        request.setAttribute("listCate", listCate);
        request.getRequestDispatcher("shopping-cart").forward(request,response);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
