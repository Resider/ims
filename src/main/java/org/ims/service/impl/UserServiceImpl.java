package org.ims.service.impl;

import cn.hutool.core.lang.Assert;
import org.ims.dao.UserMapper;
import org.ims.pojo.entity.User;
import org.ims.pojo.query.UserListQuery;
import org.ims.pojo.request.EditUserRequest;
import org.ims.service.UserService;
import org.ims.utils.SnowFlowUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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

    @Override
    public String logout(HttpServletRequest req) {
        HttpSession session = req.getSession();
        session.setAttribute("user", null);
        return "logoutJump";
    }

    @Override
    public List<User> userList(UserListQuery query) {
        return userMapper.userList(query);
    }

    @Override
    public Integer userCount(UserListQuery query) {
        return userMapper.userCount(query);
    }

    @Override
    public Boolean editUser(EditUserRequest request) {
        Long id = request.getId();
        User user = new User();
        user.setUsername(request.getUsername())
                .setPassword(request.getPassword())
                .setPhone(request.getPhone())
                .setEmail(request.getEmail())
                .setId(id)
                .setType(request.getType())
                .setStatus(1)
                .setIsDeleted(0);
        Long accountId = null;
        user.setOperationTime(accountId);
        if (user.getId() != null) {
            return userMapper.updateUser(user);
        }
        SnowFlowUtil snowFlowUtil = new SnowFlowUtil.Factory().create(5, 4);
        user.setId(snowFlowUtil.nextId());
        return userMapper.insertUser(user);
    }

    @Override
    public User userDetail(Long id) {
        return userMapper.userDetail(id);
    }

    @Override
    public Boolean del(Long id) {
        return userMapper.del(id);
    }
}
