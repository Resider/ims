package org.ims.pojo.request;

import lombok.Data;

@Data
public class WarehouseAjaxRequest {

    private String warehouseName;

    private String address;

    private Integer pageSize;

    private Integer pageIndex;


}
