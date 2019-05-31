package com.springboot.demo.entity.pro;

import com.springboot.demo.entity.Scenario;
import org.springframework.data.rest.core.config.Projection;

import java.util.Set;

@Projection(name = "scenarioPro", types = {Scenario.class})
public interface ScenarioPro {

    Integer getScenarioID();

    String getScenarioName();

    Set<TestcasePro> getTestcaseSet();

}
