package org.ims.service;

import org.ims.pojo.entity.Product;

import java.util.List;

public interface ProductService {

    Boolean editProduct(String id,String productName);

    List<Product> productList();
}
