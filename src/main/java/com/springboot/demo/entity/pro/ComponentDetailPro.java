package com.springboot.demo.entity.pro;

import com.springboot.demo.entity.ComponentDetail;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "componentDetailPro", types = {ComponentDetail.class})
public interface ComponentDetailPro {

    Integer getComponentDetailID();

    Integer getSequence();

}
