package org.ims.pojo.query;


import lombok.Data;

@Data
public class ProductListQuery {

    private String productName;

    private String productType;

    private String minCreateTime;

    private String maxCreateTime;

    private Integer start;

    private Integer end;
}
