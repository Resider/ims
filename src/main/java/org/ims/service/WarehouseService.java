package org.ims.service;

import org.ims.pojo.entity.Warehouse;
import org.ims.pojo.query.WarehouseListQuery;
import org.ims.pojo.request.EditWarehouseRequest;
import org.ims.pojo.vo.WarehouseSelectVO;

import java.util.List;

public interface WarehouseService {

    List<Warehouse> warehouseList(WarehouseListQuery query);

    Boolean del(Long id);

    Integer warehouseCount(WarehouseListQuery query);

    Boolean editWarehouse(EditWarehouseRequest query);

    List<WarehouseSelectVO> selectList();

    Warehouse warehouseDetail(Long id);
}
