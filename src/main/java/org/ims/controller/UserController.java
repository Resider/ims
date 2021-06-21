package org.ims.controller;

import org.ims.pojo.DTO.PageDTO;
import org.ims.pojo.entity.Product;
import org.ims.pojo.entity.User;
import org.ims.pojo.entity.Warehouse;
import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.query.UserListQuery;
import org.ims.pojo.request.EditUserRequest;
import org.ims.pojo.request.LoginRequest;
import org.ims.pojo.request.UserListAjaxRequest;
import org.ims.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/26 16:51
 */
@Controller("UserController")
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(HttpServletRequest req) {
        return userService.login(req);
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest req) {
        return userService.logout(req);
    }

    @RequestMapping("/userListAjax")
    @ResponseBody
    public PageDTO userListAjax(@RequestBody UserListAjaxRequest request){
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
        UserListQuery query = new UserListQuery();
        query.setUserName(request.getUserName());
        Integer start = (page.getPageIndex() - 1) * page.getPageSize();
        Integer end = page.getPageSize() * page.getPageIndex();
        query.setStart(start);
        query.setEnd(end);
        List<User> list = userService.userList(query);
        Integer count = userService.userCount(query);
        Integer sum = count % page.getPageSize() == 0 ? count / page.getPageSize() : count / page.getPageSize() + 1;
        page.setData(list);
        page.setPageCount(count);
        page.setPageSum(sum);
        return page;
    }

    @RequestMapping("/editUser")
    @ResponseBody
    public Boolean editUser(@RequestBody EditUserRequest request){
        Boolean result = userService.editUser(request);
        return result;
    }

    @RequestMapping("/userDetail")
    public String userDetail(HttpServletRequest request){
        String id = request.getParameter("id");
        User user = userService.userDetail(Long.valueOf(id));
        request.setAttribute("userInfo",user);
        return "addUser";
    }


    @RequestMapping("/del")
    @ResponseBody
    public Boolean del(@RequestParam("id") Long id) {
        return userService.del(id);
    }

}
