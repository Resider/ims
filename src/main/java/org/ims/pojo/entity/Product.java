package org.ims.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.NullSerializer;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Product implements Serializable {
    private static final long serialVersionUID = -762783586988356680L;

    @JsonSerialize(using = ToStringSerializer.class, nullsUsing = NullSerializer.class)
    private Long id;

    private String productName;

    @JsonSerialize(nullsUsing = NullSerializer.class)
    private Integer productType;

    private String productDesc;

    private String productUnit;

    @JsonSerialize(using = ToStringSerializer.class, nullsUsing = NullSerializer.class)
    private Float productQuantity;

    @JsonSerialize(using = ToStringSerializer.class, nullsUsing = NullSerializer.class)
    private Float productPrice;

    private String productSpec;

    @JsonSerialize(using = ToStringSerializer.class, nullsUsing = NullSerializer.class)
    private Long createUser;


    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createTime;

    @JsonSerialize(using = ToStringSerializer.class, nullsUsing = NullSerializer.class)
    private Long updateUser;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date updateTime;

    @JsonSerialize(nullsUsing = NullSerializer.class)
    private Integer isDeleted;

    @JsonSerialize(nullsUsing = NullSerializer.class)
    private Integer status;

    public Product setOperationTime(Long accountId) {

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


    public void setProductName(String productName) {
    }
}
