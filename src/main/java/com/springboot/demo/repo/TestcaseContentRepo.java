package com.springboot.demo.repo;

import com.springboot.demo.entity.TestcaseContent;
import com.springboot.demo.repo.cust.BatchRepo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestcaseContentRepo extends JpaRepository<TestcaseContent, Integer>, BatchRepo<TestcaseContent, Integer> {
}
