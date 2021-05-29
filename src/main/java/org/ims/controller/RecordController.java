package org.ims.controller;

import org.ims.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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


}
