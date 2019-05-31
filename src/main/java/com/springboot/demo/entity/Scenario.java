package com.springboot.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;

@Entity
@Data
@Table(name = "scenario")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(
        exclude = {"projectID"}
)
@ToString(
        exclude = {"projectID"}
)
public class Scenario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer scenarioID;

    private String scenarioName;

    @ManyToOne
    @JoinColumn(name = "projectID")
    private ProjectMaster projectID;

    private String scenarioDescription;

}
