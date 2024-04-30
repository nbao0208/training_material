package com.train.trainingmaterial.model.request.lesson;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EvaluateLessonRequest {
  @NotNull Long userId;
  @NotNull private int evaluation;
}
