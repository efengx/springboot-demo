package com.springboot.demo.repo;

import com.springboot.demo.entity.EventMaster;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EventMasterRepo extends JpaRepository<EventMaster, Integer> {


}
