package com.train.trainingmaterial.entity;

import com.train.trainingmaterial.shared.enums.Role;
import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "tm_group")
@Data
@EqualsAndHashCode(callSuper = false)
public class GroupEntity extends BaseEntity {

  @Column(name = "role")
  @Enumerated(EnumType.STRING)
  private Role role;
}
