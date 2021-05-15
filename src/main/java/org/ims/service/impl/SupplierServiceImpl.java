package org.ims.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import org.ims.dao.SupplierMapper;
import org.ims.pojo.entity.Supplier;
import org.ims.pojo.request.EditSupplierRequest;
import org.ims.service.SupplierService;
import org.ims.utils.SnowFlowUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public Boolean editSupplier(String id,String supplierName) {
        Supplier supplier = new Supplier();
        if(id != null && id != ""){
            supplier.setId(Long.valueOf(id));
        }
        supplier.setSupplierName(supplierName);
        Long accountId = null;
        supplier.setOperationTime(accountId);
        supplier.setStatus(1);
        supplier.setIsDeleted(0);
        if(supplier.getId() != null){
            return supplierMapper.updateSupplier(supplier);
        }
        SnowFlowUtil snowFlowUtil = new SnowFlowUtil.Factory().create(5,4);
        supplier.setId(snowFlowUtil.nextId());
        return supplierMapper.insertSupplier(supplier);
    }

    @Override
    public List<Supplier> supplierList() {
        return supplierMapper.supplierList();
    }
}
