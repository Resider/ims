package org.ims.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.NullSerializer;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
@Accessors(chain = true)
public class Product implements Serializable {
    private static final long serialVersionUID = -762783586988356680L;

    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    private String productName;

    private String productType;

    private String productDesc;

    private String productUnit;

    @JsonSerialize(using = ToStringSerializer.class)
    private BigDecimal productQuantity;

    @JsonSerialize(using = ToStringSerializer.class)
    private BigDecimal productPrice;

    private String productSpec;

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
}
