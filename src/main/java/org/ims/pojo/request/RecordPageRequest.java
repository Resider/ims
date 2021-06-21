package org.ims.pojo.request;

import lombok.Data;

/**
 * @author renz
 * @version 1.0
 * @date 2021/6/21 14:47
 */
@Data
public class RecordPageRequest {

    // 一页显示数据量
    private Integer pageSize;

    // 页码(当前是第几页)
    private Integer pageIndex;

}
