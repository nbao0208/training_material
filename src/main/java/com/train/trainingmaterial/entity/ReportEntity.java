package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tm_report")
@Data
@EqualsAndHashCode(callSuper = false)
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReportEntity extends BaseEntity {

  @Column(name = "status", length = 30)
  private String status;
}
