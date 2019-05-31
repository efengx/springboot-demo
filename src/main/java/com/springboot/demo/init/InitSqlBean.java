package com.springboot.demo.init;

import com.springboot.demo.entity.ProjectMaster;
import com.springboot.demo.entity.Scenario;
import com.springboot.demo.repo.ProjectMasterRepo;
import com.springboot.demo.repo.ScenarioRepo;
import com.springboot.demo.security.entity.UserMaster;
import com.springboot.demo.security.repo.UserMasterRepo;
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
    private UserMasterRepo userMasterRepository;

    @Autowired
    private ScenarioRepo scenarioRepo;

    @Override
    public void run(String... args) {
        userMasterRepository.findByLanID("s123").orElseGet(() -> {
            init();
            return null;
        });
    }

    private void init() {
        log.info("init");
        UserMaster adminUser = userMasterRepository.save(
                UserMaster.builder()
                        .lanID("s123")
                        .password("123")
                        .username("sathik")
                        .UserType("Admin")
//                        .projectID(1)
                        .build()
        );

        userMasterRepository.saveAll(Arrays.asList(
                UserMaster.builder()
                        .lanID("tester")
                        .password("kditsolutions")
                        .username("sudipta")
                        .UserType("Tester")
                        .email("deb_sudip@hotmail.com")
                        .build(),
                UserMaster.builder()
                        .lanID("sudip")
                        .password("sd123")
                        .UserType("sudip")
                        .UserType("Developer")
                        .email("deb.sudipta04@gmail.com")
                        .build()
        ));

        projectMasterRepository.saveAll(Arrays.asList(
                ProjectMaster.builder()
                    .projectID(18)
                    .projectName("TEST google")
//                    .lanID("tester")
                    .build(),
                ProjectMaster.builder()
                    .projectID(25)
                    .projectName("test")
                    .lanID(adminUser)
                    .build(),
                ProjectMaster.builder()
                    .projectID(26)
                    .projectName("4 feb 2019")
                    .lanID(adminUser)
                    .build()
        ));

        ProjectMaster demoProjectMaster = projectMasterRepository.save(
                ProjectMaster.builder()
                        .projectID(23)
                        .projectName("12 JAN 2019")
                        .lanID(adminUser)
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
