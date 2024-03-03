package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_group")
public class GroupEntity extends BaseEntity {

  @Column(name = "role", length = 10)
  private String role;
}
