package org.ims.pojo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.NullSerializer;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import org.ims.pojo.entity.Product;
import org.ims.pojo.entity.Supplier;
import org.ims.pojo.entity.Warehouse;

import java.math.BigDecimal;
import java.util.Date;


/**
 * @author renz
 * @version 1.0
 * @date 2021/6/21 14:52
 */
@Data
public class RecordPageVO {

    @JsonSerialize(using = ToStringSerializer.class, nullsUsing = NullSerializer.class)
    private Long id;

    private Product product;

    private Warehouse warehouse;

    private String operator;

    private Supplier supplier;

    @JsonSerialize(nullsUsing = NullSerializer.class)
    private Integer type;

    @JsonSerialize(nullsUsing = NullSerializer.class)
    private BigDecimal quantity;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createTime;
}
