package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tm_lesson_tag")
@Data
@EqualsAndHashCode(callSuper = false)
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LessonTagEntity extends BaseEntity {

  @ManyToOne
  @JoinColumn(
      name = "tm_lesson_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_lesson_id_tm_lesson_tag"))
  private LessonEntity lessonEntity;

  @ManyToOne
  @JoinColumn(
      name = "tm_tag_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_tag_id_tm_lesson_tag"))
  private TagEntity tagEntity;
}
