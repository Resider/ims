package org.ims.pojo.DTO;

import lombok.Data;

import java.util.List;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/19 20:06
 */
@Data
public class PageDTO<T> {

    private Integer pageIndex;

    private Integer pageSize;

    private Integer pageCount;

    private Integer pageSum;

    private List<T> data;
}
