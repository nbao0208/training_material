package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import java.time.OffsetDateTime;

@Entity
@Table(name = "tm_lesson")
public class LessonEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long ID;

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
