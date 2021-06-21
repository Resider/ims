package org.ims.controller;

import org.ims.pojo.DTO.PageDTO;
import org.ims.pojo.entity.Product;
import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.request.EditProductRequest;
import org.ims.pojo.request.ProductListAjaxRequest;
import org.ims.pojo.request.UserListAjaxRequest;
import org.ims.pojo.vo.ProductSelectVO;
import org.ims.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller("ProductController")
@RequestMapping(value = "/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping("/selectList")
    @ResponseBody
    public List<ProductSelectVO> selectList() {
        return productService.selectList();
    }

    @RequestMapping("/editProduct")
    @ResponseBody
    public Boolean editProduct(@RequestBody EditProductRequest request) {
        Boolean result = productService.editProduct(request);
        return result;
    }

    @RequestMapping("/del")
    @ResponseBody
    public Boolean del(@RequestParam("id") Long id) {
        return productService.del(id);
    }

    @RequestMapping("/productListAjax")
    @ResponseBody
    public PageDTO productListAjax(@RequestBody ProductListAjaxRequest request) {
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
            page.setPageSize(10);
        }
        ProductListQuery query = new ProductListQuery();
        query.setProductName(request.getProductName());
        query.setProductType(request.getProductType());
        query.setMinCreateTime(request.getMinCreateTime());
        query.setMaxCreateTime(request.getMaxCreateTime());
        Integer start = (page.getPageIndex() - 1) * page.getPageSize();
        Integer end = page.getPageSize() * page.getPageIndex();
        query.setStart(start);
        query.setEnd(end);
        List<Product> list = productService.productList(query);
        Integer count = productService.productCount(query);
        Integer sum = count % page.getPageSize() == 0 ? count / page.getPageSize() : count / page.getPageSize() + 1;
        page.setData(list);
        page.setPageCount(count);
        page.setPageSum(sum);
        return page;
    }

    @RequestMapping("/updateDetail")
    public String updateDetail(HttpServletRequest request){
        String id = request.getParameter("id");
        Product product = productService.detail(Long.valueOf(id));
        request.setAttribute("product",product);
        return "addProduct";
    }

}
