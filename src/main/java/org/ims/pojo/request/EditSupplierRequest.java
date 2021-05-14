package org.ims.pojo.request;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;

import java.util.Date;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/14 14:46
 */
@Data
public class  EditSupplierRequest {

    private Long id;

    private String supplierName;


}
