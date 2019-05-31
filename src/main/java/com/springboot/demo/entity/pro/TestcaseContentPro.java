package com.springboot.demo.entity.pro;

import com.springboot.demo.entity.TestcaseContent;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "testcaseContentPro", types = {TestcaseContent.class})
public interface TestcaseContentPro {

    Integer getTestcaseContentID();

    ObjectMasterPro getObjectID();

}
