package com.springboot.demo.repo;

import com.springboot.demo.entity.ComponentMaster;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ComponentMasterRepo extends JpaRepository<ComponentMaster, Integer> {

}
