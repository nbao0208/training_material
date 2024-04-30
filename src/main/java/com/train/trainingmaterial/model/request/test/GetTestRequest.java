package com.train.trainingmaterial.model.request.test;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GetTestRequest {
  @NotNull private Long userId;
  @NotNull private Long lessonId;
}
