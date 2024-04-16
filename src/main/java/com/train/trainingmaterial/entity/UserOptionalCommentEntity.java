package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tm_user_optional_comment")
@Data
@EqualsAndHashCode(callSuper = false)
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserOptionalCommentEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_comment_rating_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_comment_rating_id_tm_user_optional_comment"))
  private CommentRatingEntity commentRatingEntity;

  @Column(name = "comment")
  private String comment;
}
