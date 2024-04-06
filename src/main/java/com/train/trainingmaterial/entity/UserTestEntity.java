package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tm_user_test")
@Data
@Builder
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
public class UserTestEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_user_lesson_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_user_lesson_id_tm_user_test"))
  UserLessonEntity userLessonEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_test_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_test_id_tm_user_test"))
  TestEntity testEntity;

  @Column(name = "score", columnDefinition = "INT CHECK(score>=0)")
  private float score;

  @Column(name = "passed")
  private boolean passed;
}
