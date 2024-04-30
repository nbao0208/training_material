package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tm_lesson_comment_rating")
@Data
@EqualsAndHashCode(callSuper = false)
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LessonCommentRatingEntity extends BaseEntity {

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
}
