package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import java.time.LocalTime;
import java.time.OffsetDateTime;

@Entity
@Table(name = "tm_user_lesson")
public class UserLessonEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @ManyToOne
  @JoinColumn(
      name = "tm_user_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_user_id_tm_user_lesson"),
      unique = true)
  private UserEntity userEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_lesson_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_lesson_id_tm_user_lesson"))
  private LessonEntity lessonEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_report_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_report_id_tm_user_lesson"))
  private ReportEntity reportEntity;

  @Column(name = "view", columnDefinition = "INT CHECK (view>=0)")
  private int view;

  @Column(name = "time_reading")
  private LocalTime timeReading;

  @Column(name = "evaluation")
  private int evaluation;

  @Column(name = "created")
  private OffsetDateTime created;

  @Column(name = "modified")
  private OffsetDateTime modified;

  @Column(name = "created_by", length = 30)
  private String created_by;

  @Column(name = "modified_by", length = 30)
  private String modified_by;

  @Column(name = "is_deleted")
  private boolean is_deleted;
}
