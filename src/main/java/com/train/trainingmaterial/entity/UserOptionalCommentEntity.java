package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import java.time.OffsetDateTime;

@Entity
@Table(name = "tm_user_optional_comment")
public class UserOptionalCommentEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @ManyToOne
  @JoinColumn(
      name = "tm_user_id",
      referencedColumnName = "tm_user_id",
      foreignKey = @ForeignKey(name = "FK_tm_user_id_tm_user_optional_comment"))
  private CommentRatingEntity commentRatingEntity;

  @Column(name = "comment")
  private String comment;

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
