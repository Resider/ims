package org.ims.service.impl;

import org.ims.dao.ProductMapper;
import org.ims.pojo.entity.Product;
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
    public Boolean editProduct(String id, String productName){
        Product product = new Product();
        if(id != null && id != ""){
            product.setId(Long.valueOf(id));
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
    public List<Product> productList() {
        return null;
    }
}
