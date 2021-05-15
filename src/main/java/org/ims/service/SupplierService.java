package org.ims.service;

import org.ims.pojo.entity.Supplier;
import org.ims.pojo.request.EditSupplierRequest;

import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/14 14:54
 */
public interface SupplierService {
    // 编辑供应商
    Boolean editSupplier(String id,String supplierName);

    // 查询供应商-暂无分页
    List<Supplier> supplierList();
}
