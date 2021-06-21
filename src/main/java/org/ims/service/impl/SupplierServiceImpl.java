package org.ims.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import org.ims.dao.SupplierMapper;
import org.ims.pojo.entity.Supplier;
import org.ims.pojo.query.SupplierListQuery;
import org.ims.pojo.request.EditSupplierRequest;
import org.ims.pojo.vo.SupplierSelectVO;
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
    public Boolean editSupplier(Long id, String supplierName) {
        Supplier supplier = new Supplier();
        if (id != null) {
            supplier.setId(id);
        }
        supplier.setSupplierName(supplierName);
        Long accountId = null;
        supplier.setOperationTime(accountId);
        supplier.setStatus(1);
        supplier.setIsDeleted(0);
        if (supplier.getId() != null) {
            return supplierMapper.updateSupplier(supplier);
        }
        SnowFlowUtil snowFlowUtil = new SnowFlowUtil.Factory().create(5, 4);
        supplier.setId(snowFlowUtil.nextId());
        return supplierMapper.insertSupplier(supplier);
    }

    @Override
    public List<Supplier> supplierList(SupplierListQuery query) {

        return supplierMapper.supplierList(query);
    }

    @Override
    public Boolean del(Long id) {
        return supplierMapper.del(id);
    }

    @Override
    public Integer supplierCount(SupplierListQuery query) {
        return supplierMapper.supplierCount(query);
    }

    @Override
    public List<SupplierSelectVO> selectList() {
        return supplierMapper.selectList();
    }

    @Override
    public Supplier supplierDetail(Long id) {
        return supplierMapper.supplierDetail(id);
    }
}
