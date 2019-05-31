package com.springboot.demo.repo;


import com.springboot.demo.entity.Scenario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ScenarioRepo extends JpaRepository<Scenario, Integer> {
}
