package com.springboot.demo.control;

import com.springboot.demo.entity.ComponentDetail;
import com.springboot.demo.entity.ObjectMaster;
import com.springboot.demo.entity.ObjectRepository;
import com.springboot.demo.entity.ProjectMaster;
import com.springboot.demo.repo.ComponentDetailRepo;
import com.springboot.demo.repo.ComponentMasterRepo;
import com.springboot.demo.repo.ObjectMasterRepo;
import com.springboot.demo.repo.ObjectRepositoryRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/componentDetails")
public class ComponentDetailControl {

    @Autowired
    private ComponentDetailRepo componentDetailRepo;

    @Autowired
    private ComponentMasterRepo componentMasterRepo;

    @Autowired
    private ObjectRepositoryRepo objectRepositoryRepo;

    @Autowired
    private ObjectMasterRepo objectMasterRepo;

    @PostMapping("/batchSave")
    @Transactional
    public Integer batchSave(@RequestBody List<ComponentDetail> componentDetailList) {
        List<ComponentDetail> saveList = new ArrayList<>();
        componentDetailList.forEach(componentDetail -> {
            if (componentDetail.getObjectID().getObjectType().equals("get")) {
                componentDetail.setObjectID(null);
            } else {
                log.info("master=" + componentDetail.getComponentID().getComponentID());
                log.info("masterObject=" + componentMasterRepo.findById(componentDetail.getComponentID().getComponentID()).toString());

//            get Project
                ProjectMaster projectMaster = componentMasterRepo.findById(componentDetail.getComponentID().getComponentID()).orElseThrow(() ->
                        new RuntimeException("Template does not exist")
                ).getProjectID();

//            get Page
                List<ObjectRepository> objectRepositoryList = objectRepositoryRepo.findByPageTitleAndProjectIDProjectID(
                        componentDetail.getObjectID().getPropertyValue(),
                        projectMaster.getProjectID()
                ).orElseGet(() ->
                        Arrays.asList(objectRepositoryRepo.save(
                                ObjectRepository.builder()
                                        .projectID(projectMaster)
                                        .pageTitle(componentDetail.getObjectID().getPropertyName())
                                        .pageName(componentDetail.getObjectID().getPropertyName())
                                        .build()
                        ))
                );

//            Find duplicate objects
                componentDetail.getObjectID().setPageID(objectRepositoryList.get(0));
                List<ObjectMaster> objectMasterList = objectMasterRepo.findByPropertyValueAndProperty2ValueAndProperty3ValueAndPageIDPageID(
                        componentDetail.getObjectID().getPropertyValue(),
                        componentDetail.getObjectID().getProperty2Value(),
                        componentDetail.getObjectID().getProperty3Value(),
                        objectRepositoryList.get(0).getPageID()
                ).orElseGet(() ->
                        Arrays.asList(objectMasterRepo.save(componentDetail.getObjectID()))
                );

//            get componentDetail
                componentDetail.setObjectID(objectMasterList.get(0));

            }
            saveList.add(componentDetail);
        });
        return componentDetailRepo.saveAll(saveList).size();
    }
}
