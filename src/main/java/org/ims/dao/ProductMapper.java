package org.ims.dao;

import org.apache.ibatis.annotations.Param;
import org.ims.pojo.entity.Product;
import org.ims.pojo.entity.Supplier;
import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.query.SupplierListQuery;
import org.ims.pojo.vo.ProductSelectVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductMapper {
    Boolean updateProduct(@Param("product") Product product);

    Boolean insertProduct(@Param("product") Product product);

    List<Product> productList(@Param("query") ProductListQuery query);

    Boolean del(@Param("id") Long id);

    Integer productCount(@Param("query") ProductListQuery query);

    List<ProductSelectVO> selectList();

    Product detail(@Param("id") Long id);
}
