package org.ims.dao;

import org.apache.ibatis.annotations.Param;
import org.ims.pojo.entity.Product;
import org.ims.pojo.entity.Supplier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductMapper {
    Boolean updateProduct(@Param("product")Product product);

    Boolean insertProduct(@Param("product") Product product);

    List<Supplier> productList();
}
