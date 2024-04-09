package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tm_answer")
@Data
@EqualsAndHashCode(callSuper = false)
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AnswerEntity extends BaseEntity {
  @Column(name = "answer")
  private String answer;

  @ManyToOne
  @JoinColumn(
      name = "tm_question_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_question_id_tm_answer"))
  private QuestionEntity questionEntity;

  @Column(name = "is_correct")
  private boolean isCorrect;
}
