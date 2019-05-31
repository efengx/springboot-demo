package com.springboot.demo.repo;

import com.springboot.demo.entity.ComponentDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ComponentDetailRepo extends JpaRepository<ComponentDetail, Integer> {

    @Override
    Optional<ComponentDetail> findById(Integer integer);

}
