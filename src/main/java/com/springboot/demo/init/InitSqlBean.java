package com.springboot.demo.init;

import com.springboot.demo.entity.ProjectMaster;
import com.springboot.demo.entity.Scenario;
import com.springboot.demo.repo.ProjectMasterRepo;
import com.springboot.demo.repo.ScenarioRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.*;

@Slf4j
@Component
public class InitSqlBean implements CommandLineRunner {

    @Autowired
    private ProjectMasterRepo projectMasterRepository;

    @Autowired
    private ScenarioRepo scenarioRepo;

    @Override
    public void run(String... args) {
//        userMasterRepository.findByLanID("s123").orElseGet(() -> {
//            init();
//            return null;
//        });
    }

    private void init() {
        log.info("init");
        projectMasterRepository.saveAll(Arrays.asList(
                ProjectMaster.builder()
                    .projectID(18)
                    .projectName("TEST google")
//                    .lanID("tester")
                    .build(),
                ProjectMaster.builder()
                    .projectID(25)
                    .projectName("test")
//                    .lanID(adminUser)
                    .build(),
                ProjectMaster.builder()
                    .projectID(26)
                    .projectName("4 feb 2019")
//                    .lanID(adminUser)
                    .build()
        ));

        ProjectMaster demoProjectMaster = projectMasterRepository.save(
                ProjectMaster.builder()
                        .projectID(23)
                        .projectName("12 JAN 2019")
//                        .lanID(adminUser)
                        .projectSummary("DEMO")
                        .build()
        );

        scenarioRepo.saveAll(Arrays.asList(
                Scenario.builder()
                    .scenarioID(88)
                    .scenarioName("12 JAN 2019 test suite")
                    .scenarioDescription("Demo")
                    .projectID(demoProjectMaster)
                    .build(),
                Scenario.builder()
                    .scenarioID(92)
                    .scenarioName("test")
                    .projectID(demoProjectMaster)
                    .build(),
                Scenario.builder()
                    .scenarioID(95)
                    .scenarioName("123")
                    .projectID(demoProjectMaster)
                    .build()
        ));

    }

}
