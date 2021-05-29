package org.ims.pojo.request;

import lombok.Data;

@Data
public class WarehouseAjaxRequest {

    private String warehouseName;

    private String minCreateTime;

    private String maxCreateTime;

    private Integer pageSize;

    private Integer pageIndex;


}
