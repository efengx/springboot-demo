package com.springboot.demo.entity;


import lombok.*;

import javax.persistence.*;

@Data
@Entity
@Table(name = "testcase_detail")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(
        exclude = {"testcaseObject", "testcaseMasterID", "testcaseEvent"}
)
@ToString(
        exclude = {"testcaseObject", "testcaseMasterID", "testcaseEvent"}
)
public class TestcaseDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "testcase_detailID")
    private Integer testcaseDetailID;

    @ManyToOne
    @JoinColumn(name = "testcase_MasterID")
    private TestcaseMaster testcaseMasterID;

    @Column(name = "testcase_Steps")
    private Integer testcaseSteps;

    @ManyToOne
    @JoinColumn(name = "testcase_Event")
    private EventMaster testcaseEvent;

    @ManyToOne
    @JoinColumn(name = "testcase_Object")
    private ObjectMaster testcaseObject;

    @Column(name = "testcase_Data")
    private String testcaseData;

//    @Column(name = "testcase_Component")
//    private Integer testcaseComponent;

    private String testParameter1;

    private String testParameter2;

    private String testParameter3;

    private String testParameter4;

    private String testParameter5;

    private Boolean scrshot = false;


    @Transient
    private String eventName;

}
