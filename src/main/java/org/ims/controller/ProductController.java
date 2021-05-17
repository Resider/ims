package org.ims.controller;

import org.ims.pojo.entity.Product;
import org.ims.pojo.entity.Supplier;
import org.ims.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller("ProductController")
@RequestMapping(value = "/product")

public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping("/editProduct")
    @ResponseBody
    public Boolean editSupplier(HttpServletRequest req) {
        String  id = req.getParameter("id");
        String productName = req.getParameter("productName");
        return productService.editProduct(id,productName);
    }

    @RequestMapping("/productList")
    public String supplierList(String testParam, HttpServletRequest request, HttpServletResponse response){
        List<Product> list = productService.productList();
        request.setAttribute("list", list);
        return "productList";
    }

}
