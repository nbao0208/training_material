package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "tm_rating")
@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class RatingEntity extends BaseEntity {
  @Column(name = "level", columnDefinition = "INT CHECK (level>=1 AND level<=5)")
  private int level;
}
