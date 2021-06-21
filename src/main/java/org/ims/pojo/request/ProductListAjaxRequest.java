package org.ims.pojo.request;

import lombok.Data;

@Data
public class ProductListAjaxRequest {

    private String productName;

    private String productType;

    private String minCreateTime;

    private String maxCreateTime;

    // 一页显示数据量
    private Integer pageSize;

    // 页码(当前是第几页)
    private Integer pageIndex;
}
