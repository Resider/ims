package org.ims.controller;

import org.ims.pojo.DTO.PageDTO;
import org.ims.pojo.entity.Supplier;
import org.ims.pojo.entity.TestEntity;
import org.ims.pojo.query.SupplierListQuery;
import org.ims.pojo.request.EditSupplierRequest;
import org.ims.pojo.request.SupplierListAjaxRequest;
import org.ims.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/14 11:28
 */
@Controller("SupplierController")
@RequestMapping(value = "/supplier")
public class SupplierController {

    @Autowired
    private SupplierService supplierService;

    // 新增、修改
    @RequestMapping("/editSupplier")
    @ResponseBody
    public Boolean editSupplier(@RequestBody EditSupplierRequest request) {

        return supplierService.editSupplier(request.getId(), request.getSupplierName());
    }

    @RequestMapping("/del")
    @ResponseBody
    public Boolean del(@RequestParam("id") Long id) {
        return supplierService.del(id);
    }

 /*   @RequestMapping("/supplierList")
    public String supplierList(String testParam, HttpServletRequest request, HttpServletResponse response) {
        String supplierName = request.getParameter("supplierName");
        String minCreateTime = request.getParameter("minCreateTime");
        String maxCreateTime = request.getParameter("maxCreateTime");
        SupplierListQuery query = new SupplierListQuery();
        query.setSupplierName(supplierName);
        query.setMinCreateTime(minCreateTime);
        query.setMaxCreateTime(maxCreateTime);
        List<Supplier> list = supplierService.supplierList(query);
        request.setAttribute("list", list);
        request.setAttribute("query", query);
        return "testJsp/testSupplierList";
    }*/

    @RequestMapping("/supplierListAjax")
    @ResponseBody
    public PageDTO supplierListAjax(@RequestBody SupplierListAjaxRequest request) {
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
        SupplierListQuery query = new SupplierListQuery();
        query.setSupplierName(request.getSupplierName());
        query.setMinCreateTime(request.getMinCreateTime());
        query.setMaxCreateTime(request.getMaxCreateTime());
        Integer start = (page.getPageIndex() - 1) * page.getPageSize();
        Integer end = page.getPageSize() * page.getPageIndex();
        query.setStart(start);
        query.setEnd(end);
        List<Supplier> list = supplierService.supplierList(query);
        // 查询总条数,计算分页的总条数和总页数
        Integer count = supplierService.supplierCount(query);
        Integer sum = count % page.getPageSize() == 0 ? count / page.getPageSize() : count / page.getPageSize() + 1; // 三元运算符
        page.setData(list);
        page.setPageCount(count);
        page.setPageSum(sum);
        return page;
    }


}
