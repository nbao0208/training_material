package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_test")
public class TestEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_lesson_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_lesson_id_tm_test"))
  private LessonEntity lessonEntity;

  @Column(name = "title")
  private String title;

  @Column(name = "rule")
  private String rule;
}
