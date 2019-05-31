package com.springboot.demo.repo;

import com.springboot.demo.entity.ObjectRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ObjectRepositoryRepo extends JpaRepository<ObjectRepository, Integer> {

    Optional<List<ObjectRepository>> findByPageTitleAndProjectIDProjectID(
            @Param("pageTitle") String pageTitle,
            @Param("ProjectIDProjectID") Integer projectID
    );

}
