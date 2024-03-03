package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_user_answer")
public class UserAnswerEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_user_id",
      referencedColumnName = "tm_user_id",
      foreignKey = @ForeignKey(name = "FK_tm_user_id_tm_user_answer"))
  private UserTestEntity userTestEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_answer_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_answer_id_tm_user_answer"))
  private AnswerEntity answerEntity;
}
