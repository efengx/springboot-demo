package com.springboot.demo.entity.pro;

import com.springboot.demo.entity.TestcaseMaster;
import org.springframework.data.rest.core.config.Projection;

import java.util.Set;

@Projection(name = "testcaseMasterPro", types = {TestcaseMaster.class})
public interface TestcaseMasterPro {

    Integer getTestcaseMasterID();

    String getTestcaseName();

    Set<TestcaseDetailPro> getTestcaseDetailSet();

}
