package com.train.trainingmaterial.shared.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum LessonStatus {
  HAVE_NOT_DONE(1),
  DOING(2),
  DONE(3);
  private final long statusId;
}
