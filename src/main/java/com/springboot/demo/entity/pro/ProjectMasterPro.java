package com.springboot.demo.entity.pro;

import com.springboot.demo.entity.ProjectMaster;
import org.springframework.data.rest.core.config.Projection;

import java.util.Set;

@Projection(name = "projectMasterPro", types = { ProjectMaster.class })
public interface ProjectMasterPro {

    Integer getProjectID();

    String getProjectName();

    Set<TestcaseMasterPro> getTestcaseMasterSet();

    Set<ObjectRepositoryPro> getObjectRepositorySet();

}
