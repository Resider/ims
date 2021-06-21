package org.ims.dao;

import org.apache.ibatis.annotations.Param;
import org.ims.pojo.entity.Record;
import org.ims.pojo.query.ProductListQuery;
import org.ims.pojo.vo.RecordPageVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/29 13:36
 */
@Repository
public interface RecordMapper {
    int insertRecord(@Param("record") Record record);

    List<RecordPageVO> recordPage(@Param("query") ProductListQuery query);

    Integer recordPageCount(@Param("query") ProductListQuery query);
}
