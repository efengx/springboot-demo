package com.springboot.demo.entity;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import java.util.Set;


/**
 * The persistent class for the testcase database table.
 * 
 */
@Data
@Entity
@Table(name = "testcase")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(
		exclude = {"testcaseContentSet"}
)
@ToString(
		exclude = {"testcaseContentSet"}
)
public class Testcase {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer testcaseID;

	private String testcaseName;

	private String testcaseDescription;

	private String comments;

	private String prerequisites;

	private Integer scenarioID;

	private String testcaseDeveloper;

	@OneToMany
	@JoinColumn(name = "testcaseID")
	private Set<TestcaseContent> testcaseContentSet;

}