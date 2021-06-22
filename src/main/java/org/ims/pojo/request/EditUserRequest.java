package org.ims.pojo.request;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.NullSerializer;
import lombok.Data;

/**
 * @author renz
 * @version 1.0
 * @date 2021/6/22 4:41
 */
@Data
public class EditUserRequest {

    private Long id;

    private String username;

    private String password;

    private String phone;

    private String email;

    private Integer type;
}
