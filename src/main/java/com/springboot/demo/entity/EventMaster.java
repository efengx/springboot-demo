package com.springboot.demo.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "event_master")
@Builder
@EqualsAndHashCode(
        exclude = {"testcaseContentSet", "eventParameterSet", "testcaseDetailSet", "componentDetailSet"}
)
@ToString(
        exclude = {"testcaseContentSet", "eventParameterSet", "testcaseDetailSet", "componentDetailSet"}
)
public class EventMaster {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer eventID;

    private String eventName;

    private String freeText;

    @OneToMany
    @JoinColumn(name = "eventID")
    private Set<TestcaseContent> testcaseContentSet;

    @OneToMany
    @JoinColumn(name = "eventID")
    private Set<EventParameter> eventParameterSet;

    @OneToMany
    @JoinColumn(name = "testcase_Event")
    private Set<TestcaseDetail> testcaseDetailSet;

    @OneToMany
    @JoinColumn(name = "eventID")
    private Set<ComponentDetail> componentDetailSet;

}
