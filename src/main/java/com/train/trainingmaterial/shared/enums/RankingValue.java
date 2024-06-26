package com.train.trainingmaterial.shared.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum RankingValue {
  TWO_STARS(2),
  THREE_STARS(3),
  FOUR_STARS(4),
  FIVE_STARTS(5);

  private final int star;
}
