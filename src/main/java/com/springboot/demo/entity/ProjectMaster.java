package com.springboot.demo.entity;

import java.util.Set;

import javax.persistence.*;

import com.springboot.demo.security.entity.UserMaster;
import lombok.*;


/**
 * The persistent class for the project database table.
 */
@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "project_master")
@EqualsAndHashCode(
		exclude = {"lanID", "scenarioSet", "testcaseMasterSet", "componentMasterSet", "objectRepositorySet"}
)
@ToString(
		exclude = {"lanID", "scenarioSet", "testcaseMasterSet", "componentMasterSet", "objectRepositorySet"}
)
public class ProjectMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer projectID;

	private String projectName;

	@ManyToOne
	@JoinColumn(name = "Lan_ID")
	private UserMaster lanID;

	private String projectSummary;

	@OneToMany
	@JoinColumn(name = "projectID")
	private Set<Scenario> scenarioSet;

	@OneToMany
	@JoinColumn(name = "projectID")
	private Set<TestcaseMaster> testcaseMasterSet;

	@OneToMany
	@JoinColumn(name = "projectID")
	private Set<ComponentMaster> componentMasterSet;

	@OneToMany
	@JoinColumn(name = "projectID")
	private Set<ObjectRepository> objectRepositorySet;

}