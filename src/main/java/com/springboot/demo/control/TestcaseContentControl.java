package com.springboot.demo.control;

import com.springboot.demo.entity.TestcaseContent;
import com.springboot.demo.repo.TestcaseContentRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/testcaseContents")
public class TestcaseContentControl {

    @Autowired
    private TestcaseContentRepo testcaseContentRepo;

    @PostMapping("/batchSave")
    public Integer batchSave(@RequestBody List<TestcaseContent> testcaseContentList) {
        return testcaseContentRepo.saveAll(testcaseContentList).size();
    }

}
