package org.ims.pojo.query;

import lombok.Data;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/19 15:29
 */
@Data
public class SupplierListQuery {

    private String supplierName;

    private String minCreateTime;

    private String maxCreateTime;

    private Integer start;

    private Integer end;
}
