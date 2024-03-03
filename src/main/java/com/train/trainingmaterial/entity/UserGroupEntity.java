package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_user_group")
public class UserGroupEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_user_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_user_id_tm_user_group"))
  private UserEntity userEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_group_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_group_id_tm_user_group"))
  private GroupEntity groupEntity;
}
