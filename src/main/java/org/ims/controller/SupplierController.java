package org.ims.controller;

import org.ims.pojo.entity.Supplier;
import org.ims.pojo.entity.TestEntity;
import org.ims.pojo.request.EditSupplierRequest;
import org.ims.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.Arrays;
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
    public Boolean editSupplier(HttpServletRequest req) {
        String  id = req.getParameter("id");
        String supplierName = req.getParameter("supplierName");
        return supplierService.editSupplier(id,supplierName);
    }

    @RequestMapping("/supplierList")
    public String supplierList(String testParam, HttpServletRequest request, HttpServletResponse response){
        List<Supplier> list = supplierService.supplierList();
        request.setAttribute("list", list);
        return "supplierList";
    }


}
