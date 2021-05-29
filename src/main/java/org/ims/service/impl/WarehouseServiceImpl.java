package org.ims.service.impl;

import org.ims.dao.WarehouseMapper;
import org.ims.pojo.entity.Warehouse;
import org.ims.pojo.query.WarehouseListQuery;
import org.ims.pojo.request.EditWarehouseRequest;
import org.ims.service.WarehouseService;
import org.ims.utils.SnowFlowUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WarehouseServiceImpl implements WarehouseService {

    @Autowired
    private WarehouseMapper warehouseMapper;


    @Override
    public List<Warehouse> warehouseList(WarehouseListQuery query) {
        return warehouseMapper.warehouseList(query);
    }

    @Override
    public Boolean del(Long id) {
        return warehouseMapper.del(id);
    }

    @Override
    public Integer warehouseCount(WarehouseListQuery query) {
        return warehouseMapper.warehouseCount(query);
    }

    @Override
    public Boolean editWarehouse(EditWarehouseRequest request) {
        Long id = request.getId();
        String warehouseName = request.getWarehouseName();
        Warehouse warehouse = new Warehouse();

        if(id!=null){
            warehouse.setId(id);
        }

        warehouse.setWarehouseName(warehouseName);
        Long accountID = null;
        warehouse.setOperationTime(accountID);
        warehouse.setStatus(1);
        warehouse.setIsDeleted(0);
        if(warehouse.getId()!=null){
            return warehouseMapper.updateWarehouse(warehouse);
        }
        SnowFlowUtil snowFlowUtil = new SnowFlowUtil.Factory().create(5,4);
        warehouse.setId(snowFlowUtil.nextId());


        return warehouseMapper.insertProduct(warehouse);
    }
}
