package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_user_test")
public class UserTestEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_user_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_user_id_tm_user_test"),
      unique = true)
  UserEntity userEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_test_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_test_id_tm_user_test"))
  TestEntity testEntity;

  @Column(name = "score", columnDefinition = "INT CHECK(score>=0)")
  private int score;
}
