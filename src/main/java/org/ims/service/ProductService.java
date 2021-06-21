package org.ims.service;

import org.ims.pojo.entity.Product;
import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.query.SupplierListQuery;
import org.ims.pojo.request.EditProductRequest;
import org.ims.pojo.vo.ProductSelectVO;

import java.util.List;

public interface ProductService {

    Product detail(Long id);

    List<Product> productList(ProductListQuery query);

    Boolean del(long id);

    Integer productCount(ProductListQuery query);

    Boolean editProduct(EditProductRequest request);

    List<ProductSelectVO> selectList();
}
