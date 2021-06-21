package org.ims.dao;

import org.apache.ibatis.annotations.Param;
import org.ims.pojo.entity.User;
import org.ims.pojo.query.UserListQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/29 9:17
 */
@Repository
public interface UserMapper {

    User login(@Param("username") String username);

    List<User> userList(@Param("query") UserListQuery query);

    Integer userCount(@Param("query") UserListQuery query);

    Boolean updateUser(@Param("user") User user);

    Boolean insertUser(@Param("user") User user);

    User userDetail(@Param("id") Long id);

    Boolean del(@Param("id") Long id);
}
