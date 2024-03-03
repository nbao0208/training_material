package com.train.trainingmaterial.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tm_rating")
public class RatingEntity extends BaseEntity {

  @Column(name = "level", columnDefinition = "INT CHECK (level>=1 AND level<=5)")
  private int level;
}
