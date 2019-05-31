package com.springboot.demo.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "object_repository")
@EqualsAndHashCode(
        exclude = {"projectID"}
)
@ToString(
        exclude = {"projectID"}
)
public class ObjectRepository {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer pageID;

    private String pageName;

    @ManyToOne
    @JoinColumn(name = "projectID")
    private ProjectMaster projectID;

    private String pageTitle;

    private String pageDescription;

//    会级联死循环
//    @OneToMany
//    @JoinColumn(name = "pageID")
//    private Set<ObjectMaster> objectMasterSet;

}
