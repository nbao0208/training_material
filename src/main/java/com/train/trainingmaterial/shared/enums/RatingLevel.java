package com.train.trainingmaterial.shared.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum RatingLevel {
  ONE(1),
  TWO(2),
  THREE(3),
  FOUR(4),
  FIVE(5);
  private final int level;
}
