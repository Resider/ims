package org.ims.controller;

import org.ims.pojo.entity.TestEntity;
import org.ims.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/12 10:27
 */
@Controller("TestController")
@RequestMapping(value = "/test")
public class TestController {

    @Autowired
    private TestService testService;

    @RequestMapping(value = "/testMethod")
    public String testMethod(String testParam, HttpServletRequest request, HttpServletResponse response) {
        String result = testService.testMethod(testParam);
        System.out.println("result = " + result);
        request.setAttribute("result", result);
        return "/home.jsp";
    }


    @RequestMapping(value = "/testList")
    public String testList(HttpServletRequest request, HttpServletResponse response) {
        TestEntity t1 = new TestEntity(1L, "t1");
        TestEntity t2 = new TestEntity(2L, "t2");
        TestEntity t3 = new TestEntity(3L, "t3");
        List<TestEntity> list = Arrays.asList(t1, t2, t3);
        request.setAttribute("list", list);
        return "testList";
    }

}
