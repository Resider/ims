package org.ims.pojo.request;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class EditProductRequest {
    private Long id;

    private String productName;

    private String productType;

    private String productDesc;

    private String productUnit;

    private BigDecimal productQuantity;

    private BigDecimal productPrice;

    private String productSpec;

}
