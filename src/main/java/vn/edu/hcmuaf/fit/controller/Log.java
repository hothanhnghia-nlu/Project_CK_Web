package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Log", value = "/log")
public class Log extends HttpServlet {
    String name ="log";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Log level = new Log();
        LogService.getInstances().addLog("1", Integer.parseInt("001"),name,"add log");


        request.getRequestDispatcher("home.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
