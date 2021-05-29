package org.ims.dao;

import org.apache.ibatis.annotations.Param;
import org.ims.pojo.entity.User;
import org.springframework.stereotype.Repository;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/29 9:17
 */
@Repository
public interface UserMapper {

    User login(@Param("username") String username);
}
