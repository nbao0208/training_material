package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_lesson")
public class LessonEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_category_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = " FK_tm_category_id_tm_lesson"))
  private CategoryEntity categoryEntity;

  @Column(name = "content_link", length = 100)
  private String contentLink;

  @Column(name = "title")
  private String title;

  @Column(name = "intro")
  private String intro;
}
