package com.springboot.demo.entity.pro;

import com.springboot.demo.entity.TestcaseDetail;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "testcaseDetailPro", types = {TestcaseDetail.class})
public interface TestcaseDetailPro {

    Integer getTestcaseDetailID();

    Integer getTestcaseSteps();

}
