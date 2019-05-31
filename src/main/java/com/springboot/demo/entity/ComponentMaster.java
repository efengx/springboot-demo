package com.springboot.demo.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "componentmaster")
@EqualsAndHashCode(
        exclude = {"projectID"}
)
@ToString(
        exclude = {"projectID"}
)
public class ComponentMaster {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "componentID")
    private Integer componentID;

    private Integer pageID;

    private String componentName;

    private String componentDescription;

    @ManyToOne
    @JoinColumn(name = "projectID")
    private ProjectMaster projectID;

    @OneToMany
    @JoinColumn(name = "componentID")
    @OrderBy("sequence asc")
    private Set<ComponentDetail> componentDetailSet;

}
