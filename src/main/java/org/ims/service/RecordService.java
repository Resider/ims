package org.ims.service;

import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.request.EnterRecordRequest;
import org.ims.pojo.vo.RecordPageVO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/29 13:36
 */
public interface RecordService {
    Boolean enter(EnterRecordRequest request, HttpServletRequest req);

    List<RecordPageVO> recordPage(ProductListQuery query);

    Integer recordPageCount(ProductListQuery query);
}
