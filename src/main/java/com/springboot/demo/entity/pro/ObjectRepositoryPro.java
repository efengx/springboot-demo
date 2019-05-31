package com.springboot.demo.entity.pro;

import com.springboot.demo.entity.ObjectRepository;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "objectRepositoryPro", types = {ObjectRepository.class})
public interface ObjectRepositoryPro {

    Integer getPageID();

}
