package org.ims.dao;

import org.apache.ibatis.annotations.Param;
import org.ims.pojo.entity.Warehouse;
import org.ims.pojo.query.WarehouseListQuery;
import org.ims.pojo.vo.WarehouseSelectVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface WarehouseMapper {

    Boolean updateWarehouse(@Param("warehouse") Warehouse warehouse);

    Boolean insertWarehouse(@Param("warehouse") Warehouse warehouse);

    List<Warehouse> warehouseList(@Param("query") WarehouseListQuery query);

    Boolean del(@Param("id") Long id);

    Integer warehouseCount(@Param("query") WarehouseListQuery query);

    List<WarehouseSelectVO> selectList();

    Warehouse warehouseDetail(@Param("id") Long id);
}
