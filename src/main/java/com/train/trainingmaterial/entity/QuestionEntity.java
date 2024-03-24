package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tm_question")
@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QuestionEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_test_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_test_id_tm_question"))
  private TestEntity testEntity;

  @Column(name = "question")
  private String question;

  @Column(name = "question_type", length = 20)
  private String questionType;
}
