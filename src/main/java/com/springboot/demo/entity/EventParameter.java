package com.springboot.demo.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "event_parameter")
@Builder
@EqualsAndHashCode(
        exclude = {"eventID"}
)
@ToString(
        exclude = {"eventID"}
)
public class EventParameter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer eventParaID;

    private String paraName;

    private String paraSeq;

    private String paraType;

    @ManyToOne
    @JoinColumn(name = "eventID")
    private EventMaster eventID;

}
