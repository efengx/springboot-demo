package com.springboot.demo.entity.pro;

import com.springboot.demo.entity.ComponentMaster;
import org.springframework.data.rest.core.config.Projection;

import java.util.Set;

@Projection(name = "componentMasterPro", types = {ComponentMaster.class})
public interface ComponentMasterPro {

    Integer getComponentID();

    String getComponentName();

    Set<ComponentDetailPro> getComponentDetailSet();

}
