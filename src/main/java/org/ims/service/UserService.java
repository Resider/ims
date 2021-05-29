package org.ims.service;

import com.mysql.cj.PreparedQuery;
import lombok.Data;
import org.ims.pojo.entity.User;
import org.ims.pojo.request.LoginRequest;

import javax.servlet.http.HttpServletRequest;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/29 9:48
 */
public interface UserService {
    // 登录
    String login(HttpServletRequest req);
}
