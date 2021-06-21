package org.ims.pojo.query;

import lombok.Data;

@Data
public class WarehouseListQuery {

    private String warehouseName;

    private String address;

    private String minCreateTime;

    private String maxCreateTime;

    private Integer start;

    private Integer end;

}
