package org.ims.pojo.request;

import lombok.Data;

@Data
public class EditProductRequest {
    private Long id;

    private String productName;

    private Integer productType;

    private Float productQuantity;

    private String productSpec;

    private String productUnit;
}
