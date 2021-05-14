package org.ims.service.impl;

import org.ims.dao.SupplierMapper;
import org.ims.pojo.entity.Supplier;
import org.ims.pojo.request.EditSupplierRequest;
import org.ims.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/14 14:54
 */
@Service
public class SupplierServiceImpl implements SupplierService {

    @Autowired
    private SupplierMapper supplierMapper;

    @Override
    public Boolean editSupplier(EditSupplierRequest req) {
        Supplier supplier = new Supplier();
        supplier.setId(req.getId());
        supplier.setSupplierName(req.getSupplierName());
        Long accountId = null;
        supplier.setOperationTime(accountId);
        if(supplier.getId() != null){
            return supplierMapper.updateSupplier(supplier);
        }
        return supplierMapper.insertSupplier(supplier);
    }
}
