package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tm_user_answer")
@Data
@Builder
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
public class UserAnswerEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_user_test_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_user_test_id_tm_user_answer"))
  private UserTestEntity userTestEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_answer_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_answer_id_tm_user_answer"))
  private AnswerEntity answerEntity;
}
