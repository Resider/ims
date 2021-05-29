package org.ims.service.impl;

import cn.hutool.core.lang.Assert;
import org.ims.dao.UserMapper;
import org.ims.pojo.entity.User;
import org.ims.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/29 9:49
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public String login(HttpServletRequest req) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userMapper.login(username);
        HttpSession session = req.getSession();
        if (user == null) {
            session.setAttribute("user", null);
            session.setAttribute("msg", "the username is invalid");
            return "loginJump";
        }
        if (password.equals(user.getPassword())) {

            session.setAttribute("user", user);
            session.setAttribute("msg", "login success!");
        } else {
            session.setAttribute("user", null);
            session.setAttribute("msg", "the password is wrong!");
        }
        return "loginJump";
    }
}
