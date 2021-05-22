package org.ims.pojo.request;

import lombok.Data;

@Data
public class EditProductRequest {
    private Long id;

    private String productName;
}
