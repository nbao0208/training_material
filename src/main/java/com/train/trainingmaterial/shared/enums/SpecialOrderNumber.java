package com.train.trainingmaterial.shared.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum SpecialOrderNumber {
  DELETED_ORDER_NUMBER(-1);
  private final int number;
}
