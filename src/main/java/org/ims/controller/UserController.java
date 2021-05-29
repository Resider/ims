package org.ims.controller;

import org.ims.pojo.entity.User;
import org.ims.pojo.request.LoginRequest;
import org.ims.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

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
    private String login(HttpServletRequest req) {
        return userService.login(req);
    }
}
