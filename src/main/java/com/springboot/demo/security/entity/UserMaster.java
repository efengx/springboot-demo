package com.springboot.demo.security.entity;

import com.springboot.demo.entity.ProjectMaster;
import lombok.*;

import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "user_master")
@EqualsAndHashCode(
        exclude = {"projectID"}
)
@ToString(
        exclude = {"projectID"}
)
public class UserMaster {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String lanID;

    @Column(name = "Password")
    private String password;

    @Column(name = "Username")
	private String username;

    private String UserType;

    private String email;

//    private int projectID;

    @OneToMany
    @JoinColumn(name = "Lan_ID")
    private Set<ProjectMaster> projectID;

}