package org.ims.dao;

import org.apache.ibatis.annotations.Param;
import org.ims.pojo.entity.Supplier;
import org.springframework.stereotype.Repository;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/14 14:53
 */
@Repository
public interface SupplierMapper {
    Boolean updateSupplier(@Param("supplier") Supplier supplier);

    Boolean insertSupplier(@Param("supplier") Supplier supplier);
}
