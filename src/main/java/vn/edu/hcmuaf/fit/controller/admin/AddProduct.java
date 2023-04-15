package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.ProductService;

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
        request.getRequestDispatcher("add_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
//        ProductService pro = new ProductService();
//        String id = "0"+String.valueOf(Integer.parseInt(pro.getTopNewProduct(5).get(0).getProductID())+1);
//        String name = request.getParameter("namep");
//        String id_cate = request.getParameter("id_cate");
//        String quantity = request.getParameter("quantity");
//        String price = request.getParameter("price");
//        String discount = request.getParameter("discount");
//        String discription = request.getParameter("discription");
//        String img = request.getParameter("img");

        ArrayList<String> a = new ArrayList<>();
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            part.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
            a.add(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
        }
        response.getWriter().println(a + System.getProperty("user.dir"));
        //log
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        LogService.getInstances().addLog("1", user.getId(),name,"add log");

//        Product product;
//        if (name!= null && id_cate!= null && quantity != null && price != null && discription != null){
//            String namecate = CategoryService.getInstance().getNameByID(id_cate);
//            ProductService.getInstance().addProduct(id,id_cate,name,namecate,img,discription,Integer.parseInt(quantity),Integer.parseInt(price),Integer.parseInt(discount));
//        }
//        response.sendRedirect("/Project_CK_Web_war/admin/product?id="+id);

    }
        private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    public File getFolderUpload() {
        File folderUpload = new File( "../assets/img/Uploads");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
}
