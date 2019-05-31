package com.springboot.demo.entity;

import lombok.*;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "testcasecontent")
@Builder
@EqualsAndHashCode(
        exclude = {"testcaseID", "objectID", "eventID"}
)
@ToString(
        exclude = {"testcaseID", "objectID", "eventID"}
)
public class TestcaseContent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer testcaseContentID;

//    级联插入时，不要在ManyToOne设置 CascadeType.ALL 否则会出现重复插入情况
    @ManyToOne
    @JoinColumn(name = "testcaseID")
    private Testcase testcaseID;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "objectID")
    private ObjectMaster objectID;

//    在当前对象中会对EventMaster进行级联操作
    @ManyToOne
    @JoinColumn(name = "eventID")
//    @NotNull(message = "event not null")
    private EventMaster eventID;

    private Integer seqNum;

    private Integer compoccurrence;

    private String param1;

    private String param2;

    private String param3;

    private String param4;

    private String param5;

    private Boolean scrshot = true;

}
