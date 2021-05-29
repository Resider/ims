package org.ims.controller;

import lombok.AllArgsConstructor;
import org.ims.pojo.DTO.PageDTO;
import org.ims.pojo.entity.Warehouse;
import org.ims.pojo.query.WarehouseListQuery;
import org.ims.pojo.request.EditWarehouseRequest;
import org.ims.pojo.request.WarehouseAjaxRequest;
import org.ims.service.WarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping(value = "/warehouse")
@Controller("WarehouseController")
@AllArgsConstructor
public class WarehouseController {

    @Autowired
    private WarehouseService warehouseService;

    @RequestMapping("/editWarehouse")
    @ResponseBody
    public Boolean editWarehouse(@RequestBody EditWarehouseRequest request){

        return warehouseService.editWarehouse(request);

    }

    @RequestMapping("/del")
    @ResponseBody
    public Boolean del(@RequestParam("id") Long id){return warehouseService.del(id);}

    @RequestMapping("/warehouseListAjax")
    @ResponseBody
    public PageDTO warehouseListAjax(@RequestBody WarehouseAjaxRequest request) {

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
        WarehouseListQuery query = new WarehouseListQuery();
        query.setWarehouseName(request.getWarehouseName());
        query.setMinCreateTime(request.getMinCreateTime());
        query.setMaxCreateTime(request.getMaxCreateTime());
        Integer start = (page.getPageIndex() - 1) * page.getPageSize();
        Integer end = page.getPageSize() * page.getPageIndex();
        query.setStart(start);
        query.setEnd(end);
        List<Warehouse> list = warehouseService.warehouseList(query);
        Integer count = warehouseService.warehouseCount(query);
        Integer sum = count % page.getPageSize() == 0 ? count / page.getPageSize() : count / page.getPageSize() + 1;
        page.setData(list);
        page.setPageCount(count);
        page.setPageSum(sum);
        return page;
    }
}
