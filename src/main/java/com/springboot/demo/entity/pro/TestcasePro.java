package com.springboot.demo.entity.pro;

import com.springboot.demo.entity.Testcase;
import org.springframework.data.rest.core.config.Projection;

import java.util.Set;

@Projection(name = "testcasePro", types = {Testcase.class})
public interface TestcasePro {

    Integer getTestcaseID();

    String getTestcaseName();

    Set<TestcaseContentPro> getTestcaseContentSet();

}
