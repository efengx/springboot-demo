package com.springboot.demo.control;

import com.springboot.demo.entity.ObjectMaster;
import com.springboot.demo.entity.ObjectRepository;
import com.springboot.demo.entity.ProjectMaster;
import com.springboot.demo.entity.TestcaseDetail;
import com.springboot.demo.repo.ObjectMasterRepo;
import com.springboot.demo.repo.ObjectRepositoryRepo;
import com.springboot.demo.repo.TestcaseDetailRepo;
import com.springboot.demo.repo.TestcaseMasterRepo;
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
@RequestMapping("/testcaseDetail")
public class TestcaseDetailControl {

    @Autowired
    private TestcaseDetailRepo testcaseDetailRepo;

    @Autowired
    private TestcaseMasterRepo testcaseMasterRepo;

    @Autowired
    private ObjectRepositoryRepo objectRepositoryRepo;

    @Autowired
    private ObjectMasterRepo objectMasterRepo;

    @PostMapping("/batchSave")
    @Transactional
    public Integer batchSave(@RequestBody List<TestcaseDetail> testcaseDetailList) {
        List<TestcaseDetail> saveList = new ArrayList<>();
        testcaseDetailList.forEach(item -> {
            if (item.getEventName().equals("get")) {
                item.setTestcaseObject(null);
            } else {
//                get project
                ProjectMaster projectMaster = testcaseMasterRepo.findById(
                        item.getTestcaseMasterID().getTestcaseMasterID()
                ).orElseThrow(() ->
                    new RuntimeException("Template does not exist")
                ).getProjectID();

//                get page
                List<ObjectRepository> objectRepositoryList = objectRepositoryRepo.findByPageTitleAndProjectIDProjectID(
                        item.getTestcaseObject().getPropertyValue(),
                        projectMaster.getProjectID()
                ).orElseGet(() ->
                        Arrays.asList(objectRepositoryRepo.save(
                                ObjectRepository.builder()
                                        .projectID(projectMaster)
                                        .pageTitle(item.getTestcaseObject().getPropertyValue())
                                        .pageName(item.getTestcaseObject().getPropertyValue())
                                        .build()
                        ))
                );
                item.getTestcaseObject().setPageID(objectRepositoryList.get(0));

//                  Find duplicate objects
                List<ObjectMaster> objectMasterList = objectMasterRepo.findByPropertyValueAndProperty2ValueAndProperty3ValueAndPageIDPageID(
                        item.getTestcaseObject().getPropertyValue(),
                        item.getTestcaseObject().getProperty2Value(),
                        item.getTestcaseObject().getProperty3Value(),
                        objectRepositoryList.get(0).getPageID()
                ).orElseGet(() ->
                        Arrays.asList(objectMasterRepo.save(item.getTestcaseObject()))
                );

//                get object
                item.setTestcaseObject(objectMasterList.get(0));
            }
            saveList.add(item);
        });
        return testcaseDetailRepo.saveAll(saveList).size();
    }

}
