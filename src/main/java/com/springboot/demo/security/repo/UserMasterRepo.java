package com.springboot.demo.security.repo;

import com.springboot.demo.security.entity.UserMaster;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UserMasterRepo extends JpaRepository<UserMaster, String> {

    Optional<UserMaster> findByLanID(String lanId);

    @Deprecated
    Optional<UserMaster> findByUsernameAndPassword(
            @Param("username") String username,
            @Param("password") String password
    );

    Optional<UserMaster> findByLanIDAndPassword(
            @Param("lanID") String lanID,
            @Param("password") String password
    );

}
