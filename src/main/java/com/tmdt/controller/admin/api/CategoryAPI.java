package com.tmdt.controller.admin.api;

import com.tmdt.model.CategoryModel;
import com.tmdt.model.ProductModel;
import com.tmdt.service.ProductService;
import com.tmdt.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api-admin-category"})
public class CategoryAPI extends HttpServlet {
    @Inject
    private ProductService productService;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json"); //
        // Convert from type json to Model
        //CategoryModel categoryModel= HttpUtil.of(req.getReader()).toModel(CategoryModel.class);
        ProductModel productModel = HttpUtil.of(req.getReader()).toModel(ProductModel.class);
        productModel = productService.save(productModel);
        System.out.println(productModel);

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
