package org.ims.controller;

import org.ims.pojo.DTO.PageDTO;
import org.ims.pojo.entity.Product;
import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.request.EditProductRequest;
import org.ims.pojo.request.ProductListAjaxRequest;
import org.ims.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller("ProductController")
@RequestMapping(value = "/product")

public class ProductController {
    @Autowired
    private ProductService productService;


    @RequestMapping("/editProduct")
    @ResponseBody
    public Boolean editProduct(@RequestBody EditProductRequest request) {

        return productService.editProduct(request.getId(), request.getProductName());
    }

    @RequestMapping("/del")
    @ResponseBody
    public Boolean del(@RequestParam("id") Long id) {
        return productService.del(id);
    }

//    @RequestMapping("/productList")
//    public String supplierList(String testParam, HttpServletRequest request, HttpServletResponse response){
//        List<Product> list = productService.productList();
//        request.setAttribute("list", list);
//        return "productList";
//    }


    @RequestMapping("/productListAjax")
    @ResponseBody
    public PageDTO productListAjax(@RequestBody ProductListAjaxRequest request) {
        // 创建分页的对象类 前端传来页码和页容量,若没有传则认为是第一次打开网页,应显示第一页,默认一页五条数据
        PageDTO page = new PageDTO();
        if (request.getPageIndex() != null) {
            if (request.getPageIndex() <= 1) {
                page.setPageIndex(1);
            } else {
                page.setPageIndex(request.getPageIndex());
            }

        } else {
            page.setPageIndex(1);
        }
        if (request.getPageSize() != null) {
            page.setPageSize(request.getPageSize());
        } else {
            page.setPageSize(5);
        }
        ProductListQuery query = new ProductListQuery();
        query.setProductName(request.getProductName());
        query.setMinCreateTime(request.getMinCreateTime());
        query.setMaxCreateTime(request.getMaxCreateTime());
        Integer start = (page.getPageIndex() - 1) * page.getPageSize();
        Integer end = page.getPageSize() * page.getPageIndex();
        query.setStart(start);
        query.setEnd(end);
        List<Product> list = productService.productList(query);
        // 查询总条数,计算分页的总条数和总页数
        Integer count = productService.productCount(query);
        Integer sum = count % page.getPageSize() == 0 ? count / page.getPageSize() : count / page.getPageSize() + 1; // 三元运算符
        page.setData(list);
        page.setPageCount(count);
        page.setPageSum(sum);
        return page;
    }

}
