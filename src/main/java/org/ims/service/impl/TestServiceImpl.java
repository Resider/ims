package org.ims.service.impl;

import org.ims.service.TestService;
import org.springframework.stereotype.Service;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/12 11:05
 */
@Service
public class TestServiceImpl implements TestService {
    public String testMethod(String testParam) {
        String a = "结果为：" + testParam;
        return a;
    }
}
