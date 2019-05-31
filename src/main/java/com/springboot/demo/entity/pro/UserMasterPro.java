package com.springboot.demo.entity.pro;

import com.springboot.demo.security.entity.UserMaster;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "userMasterPro", types = {UserMaster.class})
public interface UserMasterPro {

    String getLanID();

}
