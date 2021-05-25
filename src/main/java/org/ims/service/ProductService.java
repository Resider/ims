package org.ims.service;

import org.ims.pojo.entity.Product;
import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.query.SupplierListQuery;
import org.ims.pojo.request.EditProductRequest;

import java.util.List;

public interface ProductService {

    Boolean editProduct(Long id,String productName);

    List<Product> productList(ProductListQuery query);

    Boolean del(long id);

    Integer productCount(ProductListQuery query);


}
