package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import java.time.OffsetDateTime;

@Entity
@Table(name = "tm_lesson_comment_rating")
public class LessonCommentRatingEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @ManyToOne
  @JoinColumn(
      name = "tm_comment_rating_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_comment_rating_id_tm_lesson_comment_rating"))
  private CommentRatingEntity commentRatingEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_lesson_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_lesson_id_tm_lesson_comment_rating"))
  private LessonEntity lessonEntity;

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
