package org.ims.pojo.request;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author renz
 * @version 1.0
 * @date 2021/6/18 15:57
 */
@Data
public class EnterRecordRequest {

    private Long productId;

    private Long warehouseId;

    private Long supplierId;

    private BigDecimal quantity;

    private Long operatorId;

    private Integer type;

}
