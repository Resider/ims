package org.ims.service;

import org.ims.pojo.request.EditSupplierRequest;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/14 14:54
 */
public interface SupplierService {
    // 编辑供应商
    Boolean editSupplier(EditSupplierRequest req);
}
