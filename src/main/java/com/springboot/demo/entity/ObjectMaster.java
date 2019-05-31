package com.springboot.demo.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "object_master")
@EqualsAndHashCode(
        exclude = {"componentDetailSet", "pageID", "testcaseContentSet", "testcaseDetailSet"}
)
@ToString(
        exclude = {"componentDetailSet", "pageID", "testcaseContentSet", "testcaseDetailSet"}
)
public class ObjectMaster {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer objectID;

    @ManyToOne
    @JoinColumn(name = "pageID")
    private ObjectRepository pageID;

    private String objectLogicalName;

    private String objectType;

//   fix title
    private String propertyName;
    private String propertyValue;

//    @Column(name = "index")
//    private Integer indexNum;

//    fix idPath
    private String property2Name;

    private String property2Value;

//    fix classPath
    private String property3Name;

    private String property3Value;

//    fix xpath
    private String property4Name;
    private String property4Value;


    //	id
    private String property5Name;
    private String property5Value;

    //	name
    private String property6Name;
    private String property6Value;

    //	class
    private String property7Name;
    private String property7Value;

    //	type
    private String property8Name;
    private String property8Value;

    //	value
    private String property9Name;
    private String property9Value;

    //	tag
    private String property10Name;
    private String property10Value;


    @OneToMany
    @JoinColumn(name = "objectID")
    private Set<TestcaseContent> testcaseContentSet;

    @OneToMany
    @JoinColumn(name = "testcase_Object")
    private Set<TestcaseDetail> testcaseDetailSet;

    @OneToMany
    @JoinColumn(name = "objectID")
    private Set<ComponentDetail> componentDetailSet;

}
