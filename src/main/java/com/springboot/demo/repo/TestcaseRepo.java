package com.springboot.demo.repo;

import com.springboot.demo.entity.Testcase;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestcaseRepo extends JpaRepository<Testcase, Integer> {
}
