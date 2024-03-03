package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Table(name = "tm_tag")
public class TagEntity extends BaseEntity {

  @Column(name = "level", columnDefinition = "INT CHECK ( level >= 1 AND tag.level <= 3)")
  private int level;

  @Column(name = "substance", length = 30)
  private String substance;
}
