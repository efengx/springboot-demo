package com.springboot.demo.entity;

import java.util.Set;

import javax.persistence.*;

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
		exclude = {"scenarioSet", "testcaseMasterSet", "componentMasterSet", "objectRepositorySet"}
)
@ToString(
		exclude = { "scenarioSet", "testcaseMasterSet", "componentMasterSet", "objectRepositorySet"}
)
public class ProjectMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer projectID;

	private String projectName;

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