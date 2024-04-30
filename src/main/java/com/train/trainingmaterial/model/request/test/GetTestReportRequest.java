package com.train.trainingmaterial.model.request.test;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class GetTestReportRequest {
  @NotNull private Long userId;
  @NotNull private Long testId;
  @NotNull private Long lessonId;
}
