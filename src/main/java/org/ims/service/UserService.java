package org.ims.service;

import com.mysql.cj.PreparedQuery;
import lombok.Data;
import org.ims.pojo.entity.User;
import org.ims.pojo.query.UserListQuery;
import org.ims.pojo.request.EditUserRequest;
import org.ims.pojo.request.LoginRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/29 9:48
 */
public interface UserService {

    String login(HttpServletRequest req);

    String logout(HttpServletRequest req);

    List<User> userList(UserListQuery query);

    Integer userCount(UserListQuery query);

    Boolean editUser(EditUserRequest request);

    User userDetail(Long id);

    Boolean del(Long id);
}
