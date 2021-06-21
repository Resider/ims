package org.ims.dao;

import org.apache.ibatis.annotations.Param;
import org.ims.pojo.entity.Supplier;
import org.ims.pojo.query.SupplierListQuery;
import org.ims.pojo.vo.SupplierSelectVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/14 14:53
 */
@Repository
public interface SupplierMapper {
    Boolean updateSupplier(@Param("supplier") Supplier supplier);

    Boolean insertSupplier(@Param("supplier") Supplier supplier);

    List<Supplier> supplierList(@Param("query") SupplierListQuery query);

    Boolean del(@Param("id") Long id);

    Integer supplierCount(@Param("query") SupplierListQuery query);

    List<SupplierSelectVO> selectList();

    Supplier supplierDetail(@Param("id") Long id);
}
