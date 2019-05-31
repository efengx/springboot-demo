package com.springboot.demo.repo;

import com.springboot.demo.entity.TestcaseMaster;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestcaseMasterRepo extends JpaRepository<TestcaseMaster, Integer> {



}
