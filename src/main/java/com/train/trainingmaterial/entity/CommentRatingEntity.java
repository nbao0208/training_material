package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import java.time.OffsetDateTime;

@Entity
@Table(name = "tm_comment_rating")
public class CommentRatingEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @ManyToOne
  @JoinColumn(
      name = "tm_rating_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_rating_id_tm_comment_rating"))
  private RatingEntity ratingEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_comment_template_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_comment_template_id_tm_comment_rating"))
  private CommentTemplateEntity commentTemplateEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_user_id",
      referencedColumnName = "tm_user_id",
      foreignKey = @ForeignKey(name = "FK_tm_user_id_tm_comment_rating"),
      unique = true)
  private UserLessonEntity userLessonEntity;

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
