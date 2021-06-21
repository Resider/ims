package org.ims.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.NullSerializer;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/29 9:18
 */
@Data
@Accessors(chain = true)
public class User implements Serializable {

    private static final long serialVersionUID = 2458495014936236253L;

    @JsonSerialize(using = ToStringSerializer.class, nullsUsing = NullSerializer.class)
    private Long id;

    private String username;

    private String password;

    @JsonSerialize(nullsUsing = NullSerializer.class)
    private Integer type;

    private String phone;

    private String email;

    @JsonSerialize(using = ToStringSerializer.class)
    private Long createUser;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createTime;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getCreateTime() {
        return createTime;
    }

    @JsonSerialize(using = ToStringSerializer.class)
    private Long updateUser;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date updateTime;

    private Integer isDeleted;

    private Integer status;

    public User setOperationTime(Long accountId) {

        Date date = new Date();
        if (this.getId() != null) {
            this.setUpdateTime(date);
            this.setUpdateUser(accountId);
        } else {
            this.setCreateTime(date);
            this.setCreateUser(accountId);
        }
        return this;
    }
}
