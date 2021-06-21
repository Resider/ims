package org.ims.controller;

import org.ims.pojo.DTO.PageDTO;
import org.ims.pojo.entity.Product;
import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.request.EnterRecordRequest;
import org.ims.pojo.request.RecordPageRequest;
import org.ims.pojo.vo.RecordPageVO;
import org.ims.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/29 12:23
 */
@Controller("RecordController")
@RequestMapping(value = "/record")
public class RecordController {

    @Autowired
    private RecordService recordService;

    // 入库、出库
    @RequestMapping("/enter")
    @ResponseBody
    public Boolean enter(@RequestBody EnterRecordRequest request, HttpServletRequest req) {
        Boolean result = recordService.enter(request, req);
        return result;
    }

    // 分页
    @RequestMapping("/recordPage")
    @ResponseBody
    public PageDTO recordPage(@RequestBody RecordPageRequest request) {
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

        Integer start = (page.getPageIndex() - 1) * page.getPageSize();
        Integer end = page.getPageSize() * page.getPageIndex();
        query.setStart(start);
        query.setEnd(end);
        List<RecordPageVO> list = recordService.recordPage(query);
        Integer count = recordService.recordPageCount(query);
        Integer sum = count % page.getPageSize() == 0 ? count / page.getPageSize() : count / page.getPageSize() + 1;
        page.setData(list);
        page.setPageCount(count);
        page.setPageSum(sum);
        return page;


    }

}
