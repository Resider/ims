package org.ims.service.impl;

import cn.hutool.core.bean.BeanUtil;
import org.ims.dao.ProductMapper;
import org.ims.pojo.entity.Product;
import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.query.SupplierListQuery;
import org.ims.pojo.request.EditProductRequest;
import org.ims.pojo.vo.ProductSelectVO;
import org.ims.service.ProductService;
import org.ims.utils.SnowFlowUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;


    @Override
    public Product detail(Long id) {
        return productMapper.detail(id);
    }

    @Override
    public List<Product> productList(ProductListQuery query) {
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

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Boolean editProduct(EditProductRequest request) {
        Long id = request.getId();
        String productName = request.getProductName();
        Product product = new Product();
        product.setId(request.getId())
                .setProductName(request.getProductName())
                .setProductType(request.getProductType())
                .setProductDesc(request.getProductDesc())
                .setProductUnit(request.getProductUnit())
                .setProductQuantity(request.getProductQuantity())
                .setProductPrice(request.getProductPrice())
                .setProductSpec(request.getProductSpec())
                .setStatus(1)
                .setIsDeleted(0);
        Long accountId = null;
        product.setOperationTime(accountId);
        if (product.getId() != null) {
            return productMapper.updateProduct(product);
        }
        SnowFlowUtil snowFlowUtil = new SnowFlowUtil.Factory().create(5, 4);
        product.setId(snowFlowUtil.nextId());
        return productMapper.insertProduct(product);

    }

    @Override
    public List<ProductSelectVO> selectList() {
        return productMapper.selectList();
    }

}
