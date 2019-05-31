package com.springboot.demo.repo;

import com.springboot.demo.entity.TestcaseDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestcaseDetailRepo extends JpaRepository<TestcaseDetail, Integer> {



}
