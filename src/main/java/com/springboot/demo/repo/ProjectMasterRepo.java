package com.springboot.demo.repo;

import com.springboot.demo.entity.ProjectMaster;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProjectMasterRepo extends JpaRepository<ProjectMaster, Integer> {

//    List<ProjectMaster> findByLanIDLanID(@Param("lanID") String lanID);

}
