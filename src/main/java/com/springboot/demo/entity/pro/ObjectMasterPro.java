package com.springboot.demo.entity.pro;

import com.springboot.demo.entity.ObjectMaster;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "objectMasterPro", types = {ObjectMaster.class})
public interface ObjectMasterPro {

    Integer getObjectID();

    String getObjectType();

    String getPropertyName();

    String getPropertyValue();

    String getProperty2Name();

    String getProperty2Value();

    String getProperty3Name();

    String getProperty3Value();

}
