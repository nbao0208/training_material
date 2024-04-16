package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_comment_rating")
public class CommentRatingEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_user_lesson_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_user_lesson_id_tm_comment_rating"))
  private UserLessonEntity userLessonEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_comment_template_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_comment_template_id_tm_comment_rating"))
  private CommentTemplateEntity commentTemplateEntity;
}
