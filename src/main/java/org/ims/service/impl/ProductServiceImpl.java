package org.ims.service.impl;

import org.ims.dao.ProductMapper;
import org.ims.pojo.entity.Product;
import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.query.SupplierListQuery;
import org.ims.pojo.request.EditProductRequest;
import org.ims.service.ProductService;
import org.ims.utils.SnowFlowUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public Boolean editProduct(Long id, String productName){
        Product product = new Product();
        if(id != null){
            product.setId(id);
        }

        product.setProductName(productName);
        Long accountId = null;
        product.setOperationTime(accountId);
        product.setStatus(1);
        product.setIsDeleted(0);
        if(product.getId() != null){
            return productMapper.updateProduct(product);
        }
        SnowFlowUtil snowFlowUtil = new SnowFlowUtil.Factory().create(5,4);
        product.setId(snowFlowUtil.nextId());
        return productMapper.insertProduct(product);
    }



    @Override
    public List<Product> productList(ProductListQuery query)
    {
        return productMapper.productList(query);
    }

    @Override
    public Boolean del(long id) {
        return productMapper.del(id);
    }

    @Override
    public Integer productCount(ProductListQuery query) {
        return productMapper.productCount(query);
    }
}
