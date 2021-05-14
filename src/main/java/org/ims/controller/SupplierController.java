package org.ims.controller;

import org.ims.pojo.request.EditSupplierRequest;
import org.ims.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public Boolean editSupplier(@RequestBody EditSupplierRequest req) {
        return supplierService.editSupplier(req);
    }

}
