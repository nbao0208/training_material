package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_comment_template")
public class CommentTemplateEntity extends BaseEntity {

  @Column(name = "comment")
  private String comment;

  @ManyToOne
  @JoinColumn(
      name = "tm_rating_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_rating_id_tm_comment_template"))
  private RatingEntity ratingEntity;
}
