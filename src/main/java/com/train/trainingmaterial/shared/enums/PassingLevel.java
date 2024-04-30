package com.train.trainingmaterial.shared.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum PassingLevel {
  PASSED_LEVEL(5);
  private final float scoreLevel;
}
