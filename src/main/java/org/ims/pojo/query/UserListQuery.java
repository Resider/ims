package org.ims.pojo.query;

import lombok.Data;

/**
 * @author renz
 * @version 1.0
 * @date 2021/6/22 4:17
 */
@Data
public class UserListQuery {

    private String userName;

    private Integer start;

    private Integer end;
}
