package com.springboot.demo.entity;

import lombok.*;

import javax.persistence.*;

import java.util.Set;

@Data
@Entity
@Table(name = "testcase_master")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(
        exclude = {"projectID", "testcaseDetailSet", "objectID"}
)
@ToString(
        exclude = {"projectID", "testcaseDetailSet", "objectID"}
)
public class TestcaseMaster {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "testcase_masterID")
    private Integer testcaseMasterID;

    @Column(name = "testcase_Name")
    private String testcaseName;

    @Column(name = "testcase_Precondition")
    private String testcasePrecondition;

    @Column(name = "testcase_summary")
    private String testcaseSummary;

    private Integer testcaseSteps;

    private String testcaseData;

    @ManyToOne
    @JoinColumn(name = "projectID")
    private ProjectMaster projectID;

    @OneToMany
    @JoinColumn(name = "testcase_MasterID")
    private Set<TestcaseDetail> testcaseDetailSet;

    @ManyToOne
    @JoinColumn(name = "testcase_Object")
    private ObjectMaster objectID;

    private Boolean scrshot = false;

}
