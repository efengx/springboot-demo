package com.springboot.demo.repo;

import com.springboot.demo.entity.ObjectMaster;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ObjectMasterRepo extends JpaRepository<ObjectMaster, Integer> {

    Optional<List<ObjectMaster>> findByPropertyValueAndProperty2ValueAndProperty3ValueAndPageIDPageID(
            @Param("propertyValue") String propertyValue,
            @Param("property2Value") String property2Value,
            @Param("property3Value") String property3Value,
            @Param("pageIdPageID") Integer pageId
    );

}
