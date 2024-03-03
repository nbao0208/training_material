package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_report")
public class ReportEntity extends BaseEntity {

  @Column(name = "status", length = 30)
  private String status;
}
