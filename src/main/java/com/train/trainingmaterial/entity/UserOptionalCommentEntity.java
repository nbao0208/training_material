package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_user_optional_comment")
public class UserOptionalCommentEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_user_id",
      referencedColumnName = "tm_user_id",
      foreignKey = @ForeignKey(name = "FK_tm_user_id_tm_user_optional_comment"))
  private CommentRatingEntity commentRatingEntity;

  @Column(name = "comment")
  private String comment;
}
