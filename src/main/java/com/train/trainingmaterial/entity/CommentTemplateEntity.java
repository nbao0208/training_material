package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_comment_template")
public class CommentTemplateEntity extends BaseEntity {

  @Column(name = "comment")
  private String comment;
}
