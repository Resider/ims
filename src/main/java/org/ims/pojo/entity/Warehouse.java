package org.ims.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Warehouse implements Serializable {

    private static final long serialVersionUID = -4265159073801004531L;

    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    private String warehouseName;

    private String address;

    @JsonSerialize(using = ToStringSerializer.class)
    private Long createUser;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createTime;

    @JsonSerialize(using = ToStringSerializer.class)
    private Long updateUser;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date updateTime;

    private Integer isDeleted;


    private Integer status;

    public Warehouse setOperationTime(Long accountId) {

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
