package org.ims.pojo.request;

import lombok.Data;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/19 19:01
 */
@Data
public class SupplierListAjaxRequest {

    private String supplierName;

    private String minCreateTime;

    private String maxCreateTime;

    // 一页显示数据量
    private Integer pageSize;

    // 页码(当前是第几页)
    private Integer pageIndex;
}
