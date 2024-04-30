package com.train.trainingmaterial.shared.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum TagLevelConstant {
  START_LEVEL(1),
  END_LEVEL(3);
  private final int level;
}
