package com.springboot.demo.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "componentdetail")
@EqualsAndHashCode(
        exclude = {"componentID", "objectID", "eventID"}
)
@ToString(
        exclude = {"componentID", "objectID", "eventID"}
)
public class ComponentDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer componentDetailID;

    @ManyToOne
    @JoinColumn(name = "componentID")
    private ComponentMaster componentID;

    @ManyToOne
    @JoinColumn(name = "objectID")
    private ObjectMaster objectID;

    @ManyToOne
    @JoinColumn(name = "eventID")
    private EventMaster eventID;

//    排序
    private Integer sequence;

    private String componentData;

    private String additionalData;

    private Boolean scrshot = false;

}
