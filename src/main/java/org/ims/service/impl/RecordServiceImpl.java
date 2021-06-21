package org.ims.service.impl;

import cn.hutool.core.bean.BeanUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ims.dao.ProductMapper;
import org.ims.dao.RecordMapper;
import org.ims.pojo.entity.Product;
import org.ims.pojo.entity.Record;
import org.ims.pojo.entity.User;
import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.request.EnterRecordRequest;
import org.ims.pojo.vo.RecordPageVO;
import org.ims.service.ProductService;
import org.ims.service.RecordService;
import org.ims.utils.SnowFlowUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/29 13:36
 */
@Service
public class RecordServiceImpl implements RecordService {

    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductMapper productMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Boolean enter(EnterRecordRequest request, HttpServletRequest req) {
        Long productId = request.getProductId();
        Product product = productService.detail(productId);
        if (request.getType() == 1) {
            product.setProductQuantity(product.getProductQuantity().add(request.getQuantity()));
        }
        if (request.getType() == 2) {
            product.setProductQuantity(product.getProductQuantity().subtract(request.getQuantity()));
        }
        productMapper.updateProduct(product);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        Record record = new Record();
        record.setProductId(request.getProductId())
                .setWarehouseId(request.getWarehouseId())
                .setOperatorId(request.getOperatorId())
                .setSupplierId(request.getSupplierId())
                .setType(request.getType())
                .setQuantity(request.getQuantity())
                .setOperationTime(user.getId())
                .setStatus(1)
                .setIsDeleted(0);

        SnowFlowUtil snowFlowUtil = new SnowFlowUtil.Factory().create(5, 4);
        record.setId(snowFlowUtil.nextId());
        return recordMapper.insertRecord(record) > 0;
    }

    @Override
    public List<RecordPageVO> recordPage(ProductListQuery query) {
        return recordMapper.recordPage(query);
    }

    @Override
    public Integer recordPageCount(ProductListQuery query) {
        return recordMapper.recordPageCount(query);
    }
}
